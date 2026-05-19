import 'package:hive/hive.dart';
import 'package:nex_play/core/constants/hive_const.dart';
import 'package:nex_play/core/errors/exceptions.dart';
import 'package:nex_play/core/utils/logger.dart';
import 'package:nex_play/features/auth/domain/entities/auth_tokens.dart';

abstract interface class AuthLocalDatasource {
  Future<void> saveTokens(String token, String refreshToken);
  Future<AuthTokens?> getTokens();
  Future<void> deleteTokens();
  Future<bool> hasTokens();
}

class AuthLocalDatasourceImpl implements AuthLocalDatasource {
  final Box<String?> _authBox;

  AuthLocalDatasourceImpl(this._authBox);
  @override
  Future<void> saveTokens(String token, String refreshToken) async {
    try {
      await _authBox.put(HiveConst.tokenKey, token);
      await _authBox.put(HiveConst.refreshTokenKey, refreshToken);
      AppLogger.info('Auth token saved to local storage.');
    } catch (e) {
      AppLogger.error('Failed to save token', error: e);
      throw const CacheException('Failed to save auth token.');
    }
  }

  @override
  Future<AuthTokens?> getTokens() async {
    try {
      final token = _authBox.get(HiveConst.tokenKey);
      final refreshToken = _authBox.get(HiveConst.refreshTokenKey);
      if (token != null && refreshToken != null) {
        return AuthTokens(token: token, refreshToken: refreshToken);
      }
      return null;
    } catch (e) {
      AppLogger.error('Failed to get token', error: e);
      throw const CacheException('Failed to retrieve auth token.');
    }
  }

  @override
  Future<void> deleteTokens() async {
    try {
      await _authBox.delete(HiveConst.tokenKey);
      await _authBox.delete(HiveConst.refreshTokenKey);
      AppLogger.info('Auth token cleared from local storage.');
    } catch (e) {
      AppLogger.error('Failed to clear token', error: e);
      throw const CacheException('Failed to clear auth token.');
    }
  }

  @override
  Future<bool> hasTokens() async {
    final tokens = await getTokens();
    return tokens != null;
  }
}
