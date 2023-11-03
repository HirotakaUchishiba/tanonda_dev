import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tanonda_dev/features/bottom_tab/bottom_tab.dart';

final navigationServiceProvider =
    Provider.autoDispose((ref) => NavigationService(ref));

class NavigationService {
  NavigationService(this._ref);

  final Ref _ref;

  Future<void> pushOnCurrentTab<T extends Object>({
    required String location,
    T? arguments,
  }) async =>
      _ref
          .read(bottomTabStateProvider)
          .key
          .currentState
          ?.pushNamed<void>(location, arguments: arguments);

  void popUntilFirstRoute() {
    final currentContext = _ref.read(bottomTabStateProvider).key.currentContext;
    if (currentContext == null) {
      return;
    }
    Navigator.popUntil(currentContext, (route) => route.isFirst);
  }

  Future<void> popUntilFirstRouteAndPushOnSpecifiedTab<T extends Object>({
    required BottomTab bottomTab,
    required String location,
    T? extra,
  }) async {
    final currentContext = _ref.read(bottomTabStateProvider).key.currentContext;
    if (currentContext == null) {
      return;
    }
    Navigator.popUntil(currentContext, (route) => route.isFirst);
    _ref.read(bottomTabStateProvider.notifier).update((state) => bottomTab);
    return _ref
        .read(bottomTabStateProvider)
        .key
        .currentState
        ?.pushNamed<void>(location, arguments: extra);
  }

  Future<bool> maybePop() async {
    final currentContext = _ref.read(bottomTabStateProvider).key.currentContext;
    if (currentContext == null) {
      return Future.value(false);
    }
    await Navigator.maybePop(currentContext);
    return false;
  }
}
