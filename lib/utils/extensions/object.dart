import '../constants/string.dart';
import 'string.dart';

extension ObjectExtension on Object {
  String get displayMessage {
    final message = toString()
        .trimLeft()
        .trimRight()
        .replaceAll('Exception: ', '')
        .replaceAll(RegExp(r'^Exception$'), '');
    return message.ifIsEmpty(generalExceptionMessage);
  }
}
