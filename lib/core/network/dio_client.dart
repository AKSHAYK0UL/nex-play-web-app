import 'package:dio/dio.dart';
import 'package:nex_play/core/constants/api_const.dart';
import 'package:nex_play/core/utils/logger.dart';

Dio createDio({required String? token}) {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConst.baseUrl,
      connectTimeout: Duration(seconds: ApiConst.connectTimeout),
      receiveTimeout: Duration(seconds: ApiConst.receiveTimeout),
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

  //Auth Interceptor
  if (token != null && token.isNotEmpty) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onError: (error, handler) {
          if (error.response?.statusCode == 401) {
            AppLogger.warn('Token expired or unauthorized. Logging out.');

            // trigger a logout event here/ refresh Token logic
          }
          return handler.next(error);
        },
      ),
    );
  }
  return dio;
}
