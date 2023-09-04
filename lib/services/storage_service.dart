import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:test_app/models/local/login_local_model.dart';

class StorageService {
  // final storage = FlutterSecureStorage();
  final box = Hive.box<LoginLocal>("app");

   read(String key) {
    return box.get(key);
  }

  Future<void> write(String key, dynamic value) async {
    await box.put(key, value);
  }

  Future<void> remove(String key) async {
    await box.delete(key);
  }

  static String login = 'login';
}
