import 'package:flutter/material.dart';

import 'check_network_widget.dart';

Widget materialAppCustomBuilder(BuildContext context, Widget? child) {
    return MediaQuery(
      child: CheckNetworkWidget(
        child: child ??
            Scaffold(
              body: Center(
                child: Text("Page builder Error"),
              ),
            ),
      ),
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
    );
  }