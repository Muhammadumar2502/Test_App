import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/route/route.gr.dart';

import '../../widgets/button_widgets.dart';


import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  List<String> texts = [
    "Ribbon",
    "Map",
    "Saved",
    "Profile",
  ];
  List<String> images = [
    "ribbon",
    "map",
    "saved",
    "profile",
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
          RibbonViewRoute(),
          MapViewRoute(),
          SavedViewRoute(),
          ProfileViewRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return SafeArea(
            child: Scaffold(
              body: child,
              bottomNavigationBar: Container(
                height: 67.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    images.length,
                    (index) => bottomNavigationButton(
                      text: texts[index].tr(),
                      image: images[index],
                      isSelected: index == tabsRouter.activeIndex,
                      onPressed: () {
                          tabsRouter.setActiveIndex(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
