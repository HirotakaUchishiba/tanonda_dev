import 'package:flutter/material.dart';

import 'app_router_state.dart';

typedef AppRouterWidgetBuilder = Widget Function(
  BuildContext context,
  AppRouterState state,
);

typedef AppRouterPageRoute = Route<dynamic> Function(AppRouterState state);
