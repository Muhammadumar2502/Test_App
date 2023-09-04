import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/bloc/state.dart';
import 'package:test_app/core/extensions/string_extension.dart';
import 'package:test_app/models/local/login_local_model.dart';
import 'package:test_app/models/network/login_model.dart';
import 'package:test_app/repository/login_repository.dart';
import 'package:test_app/route/route.gr.dart';
import 'package:test_app/services/loading_service.dart';
import 'package:test_app/services/storage_service.dart';
import 'package:test_app/ui/widgets/alert_widgets.dart';

import '../../bloc/login/login_bloc.dart';
import '../widgets/button_widgets.dart';
import '../widgets/field_widgets.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoadingService loadingService = LoadingService();


  bool isShowing = true;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Registration View".tr(),
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener<LoginBloc, DataState<LoginModel>>(
              listener: (context, state) async {
                if (state is DataWaiting) {
                  loadingService.showLoading(context);
                } else if (state is DataSuccess) {
                  loadingService.closeLoading(context);
                  await savedData(
                      user: state.data?.user?.toJson(),
                      tokens: state.data?.tokens?.toJson());
                  context.replaceRoute(HomeViewRoute());
                } else if (state is DataError) {
                  loadingService.closeLoading(context);
                  // error alert
                  showCustomErrorAlert(context, message: state.error!.message);
                }
              },
              child: SizedBox(),
            ),
            Form(
              key: _globalKey,
              child: Container(
                width: 1.sw,
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      color: Colors.white,
                      child: customTextField(
                        hintText: "Логин или почта",
                        keyboardType: TextInputType.emailAddress,
                        textEditingController: emailController,
                         validator: (value) {
                            if (value!.isEmpty && !value.isValidEmail()) {
                              return "Адрес электронной почты";
                            }
                             return null;
                          },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                      ),
                      child: Divider(
                        height: 3.h,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      color: Colors.white,
                      child: customTextField(
                          hintText: "Пароль",
                          keyboardType: TextInputType.name,
                          textEditingController: passwordController,
                          obscureText: true,
                          isShowing: isShowing,
                          validator: (value) {
                            if (value!.length < 8) {
                              return "Минимум 8 символов";
                            }
                            return null;
                          },
                          onSuffixTap: () {
                            setState(() {
                              isShowing = !isShowing;
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 90.h,
            ),
            customButton(
              onPressed: () async{
                if (await _globalKey.currentState!.validate()) {
                  LoginRepository.request(
                    context,
                    password: passwordController.text,
                    email: emailController.text,
                  );
                } else if (passwordController.text.length < 8) {
                  // min 8 password length error
                  // showCustomPasswordErrorAlert(context);
                }
              },
              text: "kirish".tr(),
            ),
            SizedBox(
              height: 16.h,
            ),
            customButton(
              onPressed: () {},
              text: "registratsiya qilish".tr(),
            ),
          ],
        ),
      ),
    );
  }

  Future savedData({required Map? user, required Map? tokens}) async {
    await StorageService().write(
      StorageService.login,
      LoginLocal(
        id: user?["id"],
        nickname: user?["nickname"],
        email: user?["email"],
        accessToken: tokens?["accessToken"],
        refreshToken: tokens?["refreshToken"],
      ),
    );
  }
}
