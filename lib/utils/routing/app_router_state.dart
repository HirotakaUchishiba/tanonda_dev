import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../exceptions/base.dart';
import '../logger.dart';

final appRouterStateProvider = Provider<AppRouterState>(
  (_) => throw const AppException(message: 'データが見つかりませんでした。'),
);

class AppRouterState {
  AppRouterState({
    required this.location,
    required this.name,
    this.fullpath,
    this.params = const <String, String>{},
    this.queryParams = const <String, String>{},
    this.extra,
  });

  final String location;

  final String? name;

  final String? fullpath;

  final Map<String, String> params;

  final Map<String, String> queryParams;

  final Object? extra;
}

final extractExtraDataProvider = Provider.autoDispose(
  (ref) => <T>() {
    final state = ref.read(appRouterStateProvider);
    try {
      final data = state.extra as T?;
      return data;
    } on Exception catch (e) {
      logger.info('AppRouteState.extra に指定したデータが見つかりませんでした：$e');
      return null;
      // ignore: avoid_catching_errors
    } on Error catch (e) {
      logger.info('AppRouteState.extra に指定したデータが見つかりませんでした：$e');
      return null;
    }
  },
  dependencies: <ProviderOrFamily>[appRouterStateProvider],
);
