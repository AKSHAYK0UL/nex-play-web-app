import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/utils/logger.dart';
import 'package:nex_play/features/auth/data/local/auth_local_datasource.dart';

Dio createDio({
  required String? token,
  required AuthLocalDatasource localDatasource,
}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: AuthAPI.baseUrl,
      connectTimeout: Duration(seconds: AuthAPI.connectTimeout),
      receiveTimeout: Duration(seconds: AuthAPI.receiveTimeout),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  //Log Interceptor
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestBody: true,
      responseBody: true,
      error: true,
      requestHeader: true,
      responseHeader: true,
      logPrint: (object) => AppLogger.debug(object.toString()),
    ),
  );

  //Auth Interceptor with Token Refresh
  if (token != null && token.isNotEmpty) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            AppLogger.warn('Token expired (401). Attempting refresh...');

            try {
              final tokens = await localDatasource.getTokens();
              if (tokens == null || tokens.refreshToken.isEmpty) {
                AppLogger.error('No refresh token available. Logging out.');
                await localDatasource.deleteTokens();
                return handler.next(error);
              }

              // Use a fresh Dio to avoid triggering this interceptor again
              final refreshDio = Dio(
                BaseOptions(baseUrl: AuthAPI.baseUrl),
              );

              final response = await refreshDio.post(
                AuthAPI.refreshToken,
                data: {'refreshToken': tokens.refreshToken},
              );

              final newAccessToken = response.data['access_token'] as String;
              final newRefreshToken = response.data['refresh_token'] as String;

              await localDatasource.saveTokens(
                newAccessToken,
                newRefreshToken,
              );

              AppLogger.info('Token refreshed successfully.');

              // Retry the original request with the new token
              error.requestOptions.headers['Authorization'] =
                  'Bearer $newAccessToken';
              final retryResponse = await dio.fetch(error.requestOptions);
              return handler.resolve(retryResponse);
            } catch (e) {
              AppLogger.error('Token refresh failed', error: e);
              await localDatasource.deleteTokens();
              return handler.next(error);
            }
          }
          return handler.next(error);
        },
      ),
    );
  }
  return dio;
}
