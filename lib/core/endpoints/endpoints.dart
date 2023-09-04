import 'package:flutter_dotenv/flutter_dotenv.dart';

class Endpoints {
  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;
  static String base_url = dotenv.env["base_url"] ?? "";
  static String login = dotenv.env["login"] ?? "";
  static String profile = dotenv.env["profile"] ?? "";
  static String refresh = dotenv.env["refresh"] ?? "";
  
}
