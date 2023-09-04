import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test_app/core/constants/app_consts.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../services/location_service.dart';
import 'package:auto_route/auto_route.dart';
@RoutePage()
class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> with WidgetsBindingObserver {
  YandexMapController? yandexMapController;
  Completer completer = Completer<YandexMapController>();
  Position? currPosition;
  final animation = const MapAnimation(type: MapAnimationType.smooth, duration: 1.5);

  @override
  void dispose() {
    _timer?.cancel();
    yandexMapController?.dispose();
    yandexMapController?.removeListener(() { });
    super.dispose();
  }

  moveToCurrentPosition() async {
    if (currPosition != null) {
      await yandexMapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: currPosition!.latitude,
              longitude: currPosition!.longitude,
            ),
            zoom: 14,
          ),
        ),
        animation: animation
      );
    }
  }

  Timer? _timer;
  List<MapObject> mapObjects = [];
  @override
  void initState() {
    changePointToCurrent().then((value) {
      moveToCurrentPosition();
    });
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      changePointToCurrent();
    });
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timer?.cancel();
      _timer = Timer.periodic(Duration(seconds: 10), (timer) {
        changePointToCurrent();
      });
    } else {
      _timer?.cancel();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> changePointToCurrent() async {
    try {
      currPosition = await LocationService().getCurrentPoint();
      // iwlatiw

      mapObjects.removeWhere((element) => element.mapId.value == "myId");

      if (currPosition != null) {
        mapObjects.add(
          PlacemarkMapObject(
            opacity: 1,
            isDraggable: true,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                scale: 0.4.r,
                rotationType: RotationType.noRotation,
                image: BitmapDescriptor.fromAssetImage(
                  "assets/images/me.webp",
                ),
              ),
            ),
            mapId: MapObjectId("myId"),
            point: Point(
              latitude: currPosition!.latitude,
              longitude: currPosition!.longitude,
            ),
          ),
        );
      }
    } catch (e) {
      mapObjects.removeWhere((element) => element.mapId.value == "myId");
    }

    if (mounted) {
      setState(() => {});
    }
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Map".tr(),
          style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
      ),
      body: YandexMap(
        logoAlignment: MapAlignment(
          horizontal: HorizontalAlignment.left,
          vertical: VerticalAlignment.bottom,
        ),
        mapObjects: mapObjects,
        onMapCreated: (controller) {
          yandexMapController = controller;
          completer.complete(yandexMapController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstant.activeItemColor,
        onPressed: moveToCurrentPosition,
        child: SvgPicture.asset(
          "assets/icons/move.svg",
          color: Colors.white,
          height: 30.h,
          width: 30.w,
        ),
      ),
    );
  }
}
