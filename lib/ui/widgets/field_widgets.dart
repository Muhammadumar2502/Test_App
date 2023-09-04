import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/constants/app_consts.dart';

TextFormField customTextField({
  required String hintText,
  required TextInputType keyboardType,
  required TextEditingController textEditingController,
  bool? obscureText = false,
  String? Function(String?)? validator,
  void Function()? onSuffixTap,
  bool? isShowing = false,
}) {

  return TextFormField(
    controller: textEditingController,
    cursorColor: AppConstant.activeItemColor,
    keyboardType: keyboardType,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    obscureText: obscureText! && isShowing!,
    validator: validator,
  
    style: TextStyle(
      color: AppConstant.activeItemColor,
      fontSize: 17.sp,
      fontWeight: FontWeight.w500,
    ),
    decoration: InputDecoration(

      suffix: obscureText
          ? GestureDetector(
              onTap: onSuffixTap,
              child: Icon(
                isShowing!
                    ? CupertinoIcons.eye_slash
                    : CupertinoIcons.eye_fill,
                color: AppConstant.activeItemColor,
                size: 24.w,
              ),
            )
          : null,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      
      focusedErrorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 4.w)
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red,width: 4.w),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 17.sp,
        fontWeight: FontWeight.w500,
      ),
      
      errorStyle: TextStyle(height: 0,fontSize: 12.sp,fontWeight: FontWeight.w500),
    ),
  );
}
