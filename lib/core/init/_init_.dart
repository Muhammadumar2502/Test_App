import 'package:test_app/core/init/env_init.dart';
import 'package:test_app/core/init/hive_init.dart';
import 'package:test_app/core/init/observer_init.dart';
import 'package:test_app/core/init/widget_init.dart';
import 'package:test_app/core/init/yandex_init.dart';

import 'localization_init.dart';

Future init() async {
  widget_Init();
  yandex_init();
  await localization_init();
  await env_Init();
  observerinit();
  await hiveInit();

}
