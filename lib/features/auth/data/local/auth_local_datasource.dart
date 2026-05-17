import 'package:hive/hive.dart';
import 'package:nex_play/core/constants/hive_const.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/utils/logger.dart';

abstract class AuthLocalDatasource {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> deleteToken();
  Future<bool> hasToken();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final Box<String?> _authBox;

  AuthLocalDatasourceImpl(this._authBox);
  @override
  Future<void> saveToken(String token) async {
    try {
      await _authBox.put(HiveConst.tokenKey, token);
      AppLogger.info('Auth token saved to local storage.');
    } catch (e) {
      AppLogger.error('Failed to save token', error: e);
      throw const CacheException('Failed to save auth token.');
    }
  }

  @override
  Future<String?> getToken() async {
    try {
      final token = _authBox.get(HiveConst.tokenKey);
      AppLogger.debug(
        'Token retrieved from storage: ${token != null ? "EXISTS" : "NULL"}',
      );
      return token;
    } catch (e) {
      AppLogger.error('Failed to get token', error: e);
      throw const CacheException('Failed to retrieve auth token.');
    }
  }

  @override
  Future<void> deleteToken() async {
    try {
      await _authBox.delete(HiveConst.tokenKey);
      AppLogger.info('Auth token cleared from local storage.');
    } catch (e) {
      AppLogger.error('Failed to clear token', error: e);
      throw const CacheException('Failed to clear auth token.');
    }
  }

  @override
  Future<bool> hasToken() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
