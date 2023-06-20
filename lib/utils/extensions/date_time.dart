import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  static const List<String> japaneseWeekdays = [
    '月',
    '火',
    '水',
    '木',
    '金',
    '土',
    '日'
  ];

  String toYYYYMMDD({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat('yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay)')
              .format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd').format(this);

  String toJaYYYYMMDD({bool withJapaneseWeekDay = true}) => withJapaneseWeekDay
      ? DateFormat('yyyy年MM月dd日 ($japaneseWeekDay)').format(this)
      : DateFormat('yyyy年MM月dd日').format(this);

  String toYYYYMMDDHHMM({
    String delimiter = '-',
    bool withJapaneseWeekDay = true,
  }) =>
      withJapaneseWeekDay
          ? DateFormat(
              'yyyy${delimiter}MM${delimiter}dd ($japaneseWeekDay) HH:mm',
            ).format(this)
          : DateFormat('yyyy${delimiter}MM${delimiter}dd HH:mm').format(this);

  String toJaYYYYMMDDHHMM({bool withJapaneseWeekDay = true}) =>
      withJapaneseWeekDay
          ? DateFormat('yyyy年MM月dd日 ($japaneseWeekDay) HH:mm').format(this)
          : DateFormat('yyyy年MM月dd日 HH:mm').format(this);

  String get japaneseWeekDay => japaneseWeekdays[_weekDayInt(this) - 1];

  int _weekDayInt(DateTime dateTime) => dateTime.weekday;
}
