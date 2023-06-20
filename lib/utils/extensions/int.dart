import 'package:intl/intl.dart';

final _threeDigitsFormatter = NumberFormat('#,###');

extension IntExtension on int {
  String get withComma => _threeDigitsFormatter.format(this);

  String get toJpy => '${_threeDigitsFormatter.format(this)} 円';

  int get replaceNegativeWithZero => this >= 0 ? this : 0;
}
