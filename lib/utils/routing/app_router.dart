import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/features/auth/auth.dart';
import 'package:ohima/screens/home_screen.dart';
import 'package:ohima/screens/not_found_screen.dart';
import 'package:path_to_regexp/path_to_regexp.dart';
import 'package:tuple/tuple.dart';
import '../exceptions/common.dart';
import '../extensions/dynamic.dart';
import 'app_route.dart';
import 'app_router_state.dart';
import 'app_routes.dart';

final appRouterProvider = Provider<AppRouter>((ref) => AppRouter(appRoutes, ref));

class AppRouter {
  AppRouter(this.appRoutes,this._ref);
  final List<AppRoute> appRoutes;
  final Ref _ref;
  final initialRoute = '/';

  bool requireAuthentication(String path) {
    // Add the paths that require authentication in this list.
    List<String> authRequiredRoutes = ['/profile', '/settings'];

    return authRequiredRoutes.contains(path);
  }

  /// MaterialApp や Navigator の onGenerateRoute に指定して、
  ///
  /// - 遷移するべき画面の決定、パスパラメータの解析
  /// - AppRoute.state の設定
  /// - トランジションアニメーションの決定
  ///
  /// を行うメソッド。
  /// GoRouter を参考にして、それよりも簡易で、複数 Navigator を用いて
  /// BottomNavigationBar を維持した画面遷移が行えるようにする目的。
  /// GoRouter がそれに対応したらこの AppRouter クラスの使用はやめて移行することも検討する。
  Route<dynamic> onGenerateRoute(
    RouteSettings routeSettings, {
    String? bottomNavigationPath,
  }) {
    try {
      // Check if the route requires authentication.
      if (requireAuthentication(routeSettings.name ?? '')) {
        // Get the current authentication status.
        final isSignedIn = _ref.read(isSignedInProvider).value ?? false;
        // If the user is not authenticated, redirect to '/home'.
        if (!isSignedIn) {
          return MaterialPageRoute(
            builder: (context) =>
                HomeScreen(),
          );
        }
      }
      final tuple2 = _analyzeRoute(
        routeSettings,
        bottomNavigationPath: bottomNavigationPath,
      );
      final appRoute = tuple2.item1;
      final appRouteState = tuple2.item2;
      final pageRoute = appRoute.pageRoute;
      if (pageRoute != null) {
        return pageRoute(appRouteState);
      }
      final route = MaterialPageRoute<dynamic>(
        settings: routeSettings,
        builder: (context) => appRoute.builder(
          context,
          appRouteState,
        ),
      );
      return route;
    } on RouteNotFoundException {
      final route = MaterialPageRoute<void>(
        settings: routeSettings,
        builder: (context) => const NotFoundScreen(),
      );
      return route;
    }
  }

  Tuple2<AppRoute, AppRouterState> _analyzeRoute(
    RouteSettings routeSettings, {
    String? bottomNavigationPath,
  }) {
    final location =
        _location(routeSettings, bottomNavigationPath: bottomNavigationPath);
    debugPrint('***');
    debugPrint('location: $location');
    var path = location;
    final extra = routeSettings.arguments;
    var queryParams = <String, String>{};
    if (location.contains('?')) {
      queryParams = Uri.parse(location).queryParameters;
      path = location.split('?').first;
    }
    final appRoute = appRoutes.firstWhere(
      (appRoute) => pathToRegExp(appRoute.path).matchAsPrefix(path) != null,
      orElse: () => throw RouteNotFoundException(path),
    );
    final parameters = <String>[];
    final match =
        pathToRegExp(appRoute.path, parameters: parameters).matchAsPrefix(path);
    final params = extract(parameters, match!);
    final appRouteState = AppRouterState(
      location: location,
      name: appRoute.name,
      fullpath: appRoute.path,
      params: params,
      queryParams: queryParams,
      extra: extra,
    );
    return Tuple2(appRoute, appRouteState);
  }

  /// onGenerateRoute と同じ引数を受けてパスを決定する。
  String _location(
    RouteSettings routeSettings, {
    String? bottomNavigationPath,
  }) {
    final location = routeSettings.name;
    if (location == null) {
      return '';
    }
    if (bottomNavigationPath?.isEmpty ?? true) {
      return location;
    }
    if (location == initialRoute) {
      return bottomNavigationPath!;
    }
    return location;
  }
}
