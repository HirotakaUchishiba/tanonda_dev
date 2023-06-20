import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/styles/button.dart';

enum PagerButtonType {
  previous(label: '前のページへ', iconData: FontAwesomeIcons.chevronLeft),
  next(label: '次のページへ', iconData: FontAwesomeIcons.chevronRight);

  const PagerButtonType({
    required this.label,
    required this.iconData,
  });

  final String label;
  final IconData iconData;
}

class PagerButton extends HookConsumerWidget {
  const PagerButton.previous({
    super.key,
    this.onPressed,
  }) : buttonType = PagerButtonType.previous;

  const PagerButton.next({
    super.key,
    this.onPressed,
  }) : buttonType = PagerButtonType.next;

  final PagerButtonType buttonType;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: onPressed,
      style: AppButtonStyle.white,
      child: Row(
        children: buttonType == PagerButtonType.previous
            ? _children
            : List.from(_children.reversed),
      ),
    );
  }

  List<Widget> get _children => <Widget>[
        FaIcon(buttonType.iconData, size: 14, color: Colors.black26),
        const Gap(8),
        Text(buttonType.label),
      ];
}

class PagerWidget extends HookConsumerWidget {
  const PagerWidget({
    super.key,
    required this.hasPrevious,
    required this.hasNext,
    required this.previousPageNumber,
    required this.nextPageNumber,
    this.onPreviousButtonTapped,
    this.onNextButtonTapped,
  });

  final bool hasPrevious;
  final bool hasNext;
  final int? previousPageNumber;
  final int? nextPageNumber;
  final VoidCallback? onPreviousButtonTapped;
  final VoidCallback? onNextButtonTapped;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (hasPrevious)
          PagerButton.previous(onPressed: onPreviousButtonTapped),
        if (hasNext) PagerButton.next(onPressed: onNextButtonTapped),
      ],
    );
  }
}
