import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/route/route.dart';

import 'bloc/login/login_bloc.dart';
import 'ui/widgets/main/build_widget.dart';

// ignore: must_be_immutable
class TestApp extends StatelessWidget {
  TestApp();

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return EasyLocalization(
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/languages',
      fallbackLocale: Locale('ru', 'RU'),
      child: ScreenUtilInit(
        designSize: const Size(390, 844), // iphone 11 pro max's size

        builder: (context, child) {
          return MultiBlocProvider(
            providers: providers,
            child: CupertinoApp.router(
              builder: materialAppCustomBuilder,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              routerConfig: appRouter.config(),
              theme: CupertinoThemeData(
                textTheme: CupertinoTextThemeData(
                    textStyle: TextStyle(fontFamily: 'Manrope')),
                applyThemeToAll: true,
              ),
            ),
            
          );
        },
      ),
    );
  }
}

List<BlocProvider> providers = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(),
    lazy: false,
  ),
];
