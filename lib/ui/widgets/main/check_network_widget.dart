import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';



enum NetworkResult { on, off }

// ignore: must_be_immutable
class CheckNetworkWidget extends StatefulWidget {
  Widget? child;
  CheckNetworkWidget({super.key, required this.child});

  @override
  State<CheckNetworkWidget> createState() => _CheckNetworkWidgetState();
}

class _CheckNetworkWidgetState extends State<CheckNetworkWidget> {
  NetworkResult result = NetworkResult.on;
  StreamSubscription<ConnectivityResult>? subscription;

  startListen() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult res) async {
      if (res != ConnectivityResult.none) {
        result = (await InternetConnectionChecker().hasConnection)
            ? NetworkResult.on
            : NetworkResult.off;
      } else {
        result = NetworkResult.off;
      }
      setState(() => {});
    });
  }

  cancelListen() {
    subscription!.cancel();
  }

  initChecker() async {
    result = (await InternetConnectionChecker().hasConnection)
        ? NetworkResult.on
        : NetworkResult.off;
                    setState(() => {});
                  
  }
  @override
  void setState(VoidCallback fn) {
   if (mounted) {
      super.setState(fn);
   }
  }
  @override
  void initState() {
    initChecker();
    startListen();
    super.initState();
  }

  @override
  void dispose() {
    cancelListen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        result == NetworkResult.off
            ? AbsorbPointer(
                child: widget.child ?? SizedBox(),
              )
            : widget.child!,
        AnimatedCrossFade(
          duration: Duration(milliseconds: 500),
          crossFadeState: result == NetworkResult.off
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: 
          Container(
            width: 1.sw,
            height: 1.sh,
            color: Colors.black12,
            child: Center(
              child: CupertinoAlertDialog(
                title: Text(
                  "Internet yo'q".tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
                content: Text(
                  'Iltimos internetingizni tekshiring'.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      result = (await InternetConnectionChecker().hasConnection)
                          ? NetworkResult.on
                          : NetworkResult.off;
                    setState(() => {});
                    },
                    child: Text(
                      'Tushunarli'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         
          secondChild: const SizedBox(),
        ),
      ],
    );
  }
}
