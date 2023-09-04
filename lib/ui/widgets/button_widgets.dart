import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/constants/app_consts.dart';

Widget bottomNavigationButton(
    {required String text,
    required String image,
    required bool isSelected,
    required VoidCallback onPressed}) {
  Color color =
      isSelected ? AppConstant.activeItemColor : AppConstant.noActiveItemColor;
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      color: Colors.transparent,
      child: Padding(
        padding:  EdgeInsets.all(10.0.h),
        child: Container(
          width: 70.w,
          height: 47.h,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  "assets/icons/" + image + ".svg",
                  width: 18.w,
                  height: 18.h,
                  color: color,
                ),
                Text(
                  text,
                  style: TextStyle(color: color, fontSize: 11.sp),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget customButton({required VoidCallback onPressed, required String text}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(primary: AppConstant.activeItemColor,shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.r,),),
      
    ),fixedSize: Size(353.w, 72.h)),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 17.sp,
      ),
    ),
  );
}
