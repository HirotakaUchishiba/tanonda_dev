import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/exceptions/base.dart';
import '../utils/routing/app_router_state.dart';

/// invitationId を取得してから返す Provider。
final invitationIdProvider = Provider.autoDispose<String>(
  (ref) {
    try {
      final state = ref.read(appRouterStateProvider);
      final invitationId = state.params['invitationId']!;
      return invitationId;
    } on Exception {
      throw const AppException(message: '詳細が見つかりませんでした。');
    }
  },
  dependencies: <ProviderOrFamily>[
    appRouterStateProvider,
  ],
);

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({super.key});

  static const path = '/invitations/:invitationId';
  static const name = 'InvitationScreen';
  static String location({required String invitationId}) => '/invitations/$invitationId';

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
