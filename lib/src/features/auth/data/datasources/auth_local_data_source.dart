import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/cache/secure_storage.dart';

abstract class IAuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  Future<void> cacheUserFirstName(String? firstName);
  Future<void> cacheUserLastName(String? lastName);
  Future<void> cacheUserAvatar(String? avatarUrl);
  Future<String?> getUserFirstName();
  Future<String?> getUserLastName();
  Future<String?> getUserAvatar();
  Future<void> clearUserFirstName();
  Future<void> clearUserLastName();
  Future<void> clearUserAvatar();
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final SecureCacheHelper secureStorage;

  AuthLocalDataSource({required this.secureStorage});

  @override
  Future<void> cacheToken(String token) async {
    await secureStorage.saveData(key: 'access_token', value: token);
  }

  @override
  Future<void> cacheUserFirstName(String? firstName) async {
    await secureStorage.saveData(
      key: 'user_first_name',
      value: firstName ?? 'Lela',
    );
  }

  @override
  Future<void> cacheUserLastName(String? lastName) async {
    await secureStorage.saveData(
      key: 'user_last_name',
      value: lastName ?? 'Fieta',
    );
  }

  @override
  Future<void> cacheUserAvatar(String? avatarUrl) async {
    await secureStorage.saveData(key: 'user_avatar', value: avatarUrl ?? '');
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.getData(key: 'access_token');
  }

  @override
  Future<String?> getUserFirstName() async {
    return await secureStorage.getData(key: 'user_first_name');
  }

  @override
  Future<String?> getUserLastName() async {
    return await secureStorage.getData(key: 'user_last_name');
  }

  @override
  Future<String?> getUserAvatar() async {
    return await secureStorage.getData(key: 'user_avatar');
  }

  @override
  Future<void> clearToken() async {
    await secureStorage.removeData(key: 'access_token');
  }

  @override
  Future<void> clearUserFirstName() async {
    await secureStorage.removeData(key: 'user_first_name');
  }

  @override
  Future<void> clearUserLastName() async {
    await secureStorage.removeData(key: 'user_last_name');
  }

  @override
  Future<void> clearUserAvatar() async {
    await secureStorage.removeData(key: 'user_avatar');
  }
}
