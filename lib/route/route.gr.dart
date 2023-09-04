// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:test_app/ui/views/home/1_ribbonView.dart' as _i6;
import 'package:test_app/ui/views/home/2_mapView.dart' as _i2;
import 'package:test_app/ui/views/home/3_savedView.dart' as _i7;
import 'package:test_app/ui/views/home/4_profileView.dart' as _i4;
import 'package:test_app/ui/views/home/mainView.dart' as _i1;
import 'package:test_app/ui/views/pageNotView.dart' as _i3;
import 'package:test_app/ui/views/registrationView.dart' as _i5;
import 'package:test_app/ui/views/splashView.dart' as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    MapViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MapView(),
      );
    },
    PageNotFoundRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PageNotFound(),
      );
    },
    ProfileViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileView(),
      );
    },
    RegistrationViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegistrationView(),
      );
    },
    RibbonViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RibbonView(),
      );
    },
    SavedViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SavedView(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<void> {
  const HomeViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.MapView]
class MapViewRoute extends _i9.PageRouteInfo<void> {
  const MapViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MapViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'MapViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PageNotFound]
class PageNotFoundRoute extends _i9.PageRouteInfo<void> {
  const PageNotFoundRoute({List<_i9.PageRouteInfo>? children})
      : super(
          PageNotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'PageNotFoundRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ProfileView]
class ProfileViewRoute extends _i9.PageRouteInfo<void> {
  const ProfileViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProfileViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegistrationView]
class RegistrationViewRoute extends _i9.PageRouteInfo<void> {
  const RegistrationViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegistrationViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RibbonView]
class RibbonViewRoute extends _i9.PageRouteInfo<void> {
  const RibbonViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RibbonViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RibbonViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SavedView]
class SavedViewRoute extends _i9.PageRouteInfo<void> {
  const SavedViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SavedViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SavedViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashView]
class SplashViewRoute extends _i9.PageRouteInfo<void> {
  const SplashViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
