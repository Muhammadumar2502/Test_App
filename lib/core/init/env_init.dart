
import 'package:flutter_dotenv/flutter_dotenv.dart';

env_Init() async {
  await dotenv.load(fileName: ".env");
}
