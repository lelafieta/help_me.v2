import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSourceImpl({required this.secureStorage});

  @override
  Future<void> cacheToken(String token) async {
    await secureStorage.write(key: 'access_token', value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: 'access_token');
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.delete(key: 'access_token');
  }
}
