import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showCustomErrorAlert(BuildContext context,
    {required String? message}) async {
  return await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => new CupertinoAlertDialog(
            title: new Text(
              "Ошибка",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20.sp,
              ),
            ),
            content: new Text(
              message ?? "Что-то пошло не так !",
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14.sp,
              ),
            ),
            insetAnimationCurve: Curves.bounceOut,
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () => context.popRoute(),
                child: Text(
                  "Понимаю",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),);
}
