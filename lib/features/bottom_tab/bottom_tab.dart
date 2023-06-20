import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ohima/screens/calendar_screen.dart';
import 'package:ohima/screens/invitations_screen.dart';
import 'package:ohima/screens/profile_screen.dart';

final bottomTabStateProvider = StateProvider<BottomTab>((_) => bottomTabs[0]);

enum BottomTabEnum {
  about(label: 'invitations', location: InvitationsScreen.location),
  calendars(label: 'calendar', location: CalendarScreen.location),
  profile(label: 'profile', location: ProfileScreen.location);

  const BottomTabEnum({
    required this.label,
    required this.location,
  });

  final String label;
  final String location;
}

class BottomTab {
  const BottomTab._({
    required this.index,
    required this.key,
    required this.bottomTabEnum,
  });

  final int index;
  final GlobalKey<NavigatorState> key;
  final BottomTabEnum bottomTabEnum;
}

final bottomTabIconProvider =
    Provider.family<Widget, BottomTabEnum>((ref, bottomTabEnum) {
  switch (bottomTabEnum) {
    case BottomTabEnum.about:
      return const FaIcon(FontAwesomeIcons.envelope);
    case BottomTabEnum.calendars:
      return const FaIcon(FontAwesomeIcons.list);
    case BottomTabEnum.profile:
      return const FaIcon(FontAwesomeIcons.userPen);
  }
});

final bottomTabs = <BottomTab>[
  BottomTab._(
    index: 0,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.about,
  ),
  BottomTab._(
    index: 1,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.calendars,
  ),
  BottomTab._(
    index: 2,
    key: GlobalKey<NavigatorState>(),
    bottomTabEnum: BottomTabEnum.profile,
  ),
];

final bottomNavigationBarItemOnTapProvider = Provider<void Function(int)>(
  (ref) => (index) {
    FocusManager.instance.primaryFocus?.unfocus();
    final bottomTab = bottomTabs[index];
    final currentBottomTab = ref.watch(bottomTabStateProvider);
    if (bottomTab == currentBottomTab) {
      bottomTab.key.currentState!.popUntil((route) => route.isFirst);
      return;
    }
    ref.read(bottomTabStateProvider.notifier).update((state) => bottomTab);
  },
);
