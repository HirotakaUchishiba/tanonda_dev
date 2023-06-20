import 'types.dart';

class AppRoute {
  AppRoute({
    required this.path,
    required this.name,
    required this.builder,
    this.pageRoute,
  });

  final String name;

  final String path;

  final AppRouterWidgetBuilder builder;

  final AppRouterPageRoute? pageRoute;
}
