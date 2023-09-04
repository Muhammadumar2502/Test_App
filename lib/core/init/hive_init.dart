import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/models/local/login_local_model.dart';

hiveInit()async{
  await Hive.initFlutter();
  Hive.registerAdapter(LoginLocalAdapter());
  await Hive.openBox<LoginLocal>("app");
}

