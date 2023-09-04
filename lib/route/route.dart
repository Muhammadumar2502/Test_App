import 'package:auto_route/auto_route.dart';
import "route.gr.dart";

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends $AppRouter {
  @override
  List<CustomRoute> get routes => [
        CustomRoute(
          initial: true,
          page: SplashViewRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: "/SplashViewRoute",
        ),
        CustomRoute(
          page: HomeViewRoute.page,
          children: [
            CustomRoute(
              page: RibbonViewRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              path: "RibbonViewRoute",
            ),
            CustomRoute(
              page: MapViewRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              path: "MapViewRoute",
            ),
            CustomRoute(
              page: SavedViewRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              path: "SavedViewRoute",
            ),
            CustomRoute(
              page: ProfileViewRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
              path: "ProfileViewRoute",
            ),
          ],
          path: "/HomeViewRoute",
        ),
        CustomRoute(
          page: PageNotFoundRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: "/PageNotFoundRoute",
        ),
        CustomRoute(
          page: RegistrationViewRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          path: "/RegistrationViewRoute",
        ),
      ];
}
