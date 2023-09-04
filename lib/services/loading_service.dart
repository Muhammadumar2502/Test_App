import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_consts.dart';

class LoadingService {
  showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor:  AppConstant.activeItemColor.withOpacity(0.3),
      builder: (context) => WillPopScope(
        onWillPop: ()async{
           return false;
        },
        child: AlertDialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          content: SizedBox(
            width: 100.w,
            height: 100.w,
            child: Center(
              child: CupertinoActivityIndicator(radius: 25.w,color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  
  }

  closeLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
