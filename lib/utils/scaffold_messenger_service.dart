import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utils/extensions/string.dart';
import 'constants/snack_bar.dart';
import 'constants/string.dart';

final scaffoldMessengerKeyProvider =
    Provider((_) => GlobalKey<ScaffoldMessengerState>());

final scaffoldMessengerServiceProvider =
    Provider.autoDispose(ScaffoldMessengerService.new);

class ScaffoldMessengerService {
  ScaffoldMessengerService(this._ref);

  final AutoDisposeProviderRef<ScaffoldMessengerService> _ref;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _ref.read(scaffoldMessengerKeyProvider);

  Future<T?> showDialogByBuilder<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: scaffoldMessengerKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  Future<T?> showModalBottomSheetByBuilder<T>({
    required Widget Function(BuildContext) builder,
  }) async {
    return showModalBottomSheet<T>(
      context: scaffoldMessengerKey.currentContext!,
      builder: builder,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
    Duration duration = defaultSnackBarDuration,
  }) {
    final scaffoldMessengerState = scaffoldMessengerKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    return scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: defaultSnackBarBehavior,
        duration: duration,
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarByException(Exception e) {
    final message =
        e.toString().replaceAll('Exception: ', '').replaceAll('Exception', '');
    return showSnackBar(message.ifIsEmpty(generalExceptionMessage));
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarByFirebaseException(
    FirebaseException e,
  ) {
    return showSnackBar(
      '[${e.code}]: ${e.message ?? 'FirebaseException が発生しました。'}',
    );
  }

  ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>
      showMaterialBanner(
    String message, {
    IconData leadingIconData = Icons.info,
    Color backgroundColor = Colors.red,
    bool removeCurrentSnackBar = true,
    List<Widget> actions = const <Widget>[],
  }) {
    final scaffoldMessengerState = scaffoldMessengerKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    return scaffoldMessengerState.showMaterialBanner(
      MaterialBanner(
        content: const Text('Hello, I am a Material Banner'),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.orange,
        actions: [
          TextButton(
            child: const Text('Dismiss'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
