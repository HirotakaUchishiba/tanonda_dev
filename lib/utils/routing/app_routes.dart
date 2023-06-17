import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/screens/invitations_screen.dart';
import 'package:ohima/screens/calendar_screen.dart';
import 'package:ohima/screens/main_screen.dart';
import 'package:ohima/screens/not_found_screen.dart';
import 'package:ohima/screens/profile_screen.dart';
import 'app_route.dart';
import 'app_router_state.dart';

/// AppRoute インスタンスの一覧
/// 各ページのコンストラクタに引数を渡さない済むように、そのような場合は ProviderScope.override で
/// appRouterStateProvider の値をオーバーライドして、各画面を AppState をオーバーライドされた
/// Provider 経由で取得するようにする。
final appRoutes = <AppRoute>[
  AppRoute(
    path: MainScreen.path,
    name: MainScreen.name,
    builder: (context, state) => const MainScreen(key: ValueKey(MainScreen.name)),
  ),
  AppRoute(
    path: InvitationsScreen.path,
    name: InvitationsScreen.name,
    builder: (context, state) => const InvitationsScreen(key: ValueKey(InvitationsScreen.name)),
  ),
  AppRoute(
    path: CalendarScreen.path,
    name: CalendarScreen.name,
    builder: (context, state) => const CalendarScreen(key: ValueKey(CalendarScreen.name)),
  ),
    AppRoute(
    path: ProfileScreen.path,
    name: ProfileScreen.name,
    builder: (context, state) => const ProfileScreen(key: ValueKey(ProfileScreen.name)),
  ),
  AppRoute(
    path: NotFoundScreen.path,
    name: NotFoundScreen.name,
    builder: (context, state) =>
        const NotFoundScreen(key: ValueKey(NotFoundScreen.name)),
  ),
];