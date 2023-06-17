import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/features/invitation/invitation.dart';
import 'package:ohima/utils/loading.dart';
import 'package:ohima/widgets/empty_placeholder.dart';
import 'package:ohima/widgets/unapproved_invitation_widget.dart';

import '../features/user_id_provider.dart';
import '../utils/hooks/package_info_state.dart';

class InvitationsScreen extends HookConsumerWidget {
  const InvitationsScreen({super.key});

  static const path = '/invitations';
  static const name = 'InvitationsScreen';
  static const location = path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.watch(userIdProvider);
    final packageInfoState = usePackageInfoState();
    final packageInfo = packageInfoState.packageInfo;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '招待状',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          bottom: TabBar(
            padding: const EdgeInsets.only(left: 20, right: 20),
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.pinkAccent),
            tabs: const [
              Tab(text: '未承認'),
              Tab(text: '承認済'),
            ],
          ),
        ),
        body: userId == null
            ? const EmptyPlaceholderWidget(
                message: '招待状を表示するにはサインインが必要です。'
                    '「About > 匿名サインインから匿名でのサインインを行ってください。',
              )
            : ref.watch(invitationsStreamProvider).when(
                  data: (invitations) {
                    if (invitations.isEmpty) {
                      return const EmptyPlaceholderWidget(
                        widget: FaIcon(
                          FontAwesomeIcons.envelopeOpenText,
                          color: Colors.black45,
                          size: 48,
                        ),
                        message: 'まだ招待状がありません。',
                      );
                    }
                    return TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: ListView.builder(
                            itemCount: invitations.length,
                            itemBuilder: (context, index) {
                              final invitation = invitations[index];
                              return unapprovedInvitationWidget(
                                  context, invitation.invitationId);
                            },
                          ),
                        ),
                        const SingleChildScrollView(
                          child: SizedBox(),
                        ),
                      ],
                    );
                  },
                  error: (_, __) => const SizedBox(),
                  loading: () => const PrimarySpinkitCircle(),
                ),
      ),
    );
  }
}
