import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:auto_route/auto_route.dart';
import 'package:test_app/models/local/login_local_model.dart';
import 'package:test_app/route/route.gr.dart';

import '../../services/storage_service.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1), () async {
      if (await checkToken()) {
        context.replaceRoute(HomeViewRoute());
      } else {
        context.replaceRoute(RegistrationViewRoute());
      }
    });
    super.initState();
  }

  Future<bool> checkToken() async {
    LoginLocal? logindata = await StorageService().read(StorageService.login);
    return logindata?.refreshToken != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 200.w,
        ),
      ),
    );
  }
}
