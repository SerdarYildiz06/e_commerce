import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  Future<void> set(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> get(String key) async {
    return await secureStorage.read(key: key);
  }

  Future<void> clear() async {
    await secureStorage.deleteAll();
  }
}
