import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static const key = 'token';
  AndroidOptions _getAndroidOptions() => AndroidOptions();
  static setToken(String token) {
    const secureStorage = FlutterSecureStorage();
    secureStorage.write(key: key, value: token);
  }

  static Future<String?> getToken() async {
    const secureStorage = FlutterSecureStorage();
    return await secureStorage.read(key: key);
  }
}
