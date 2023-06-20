

import 'package:ohima/utils/extensions/string.dart';

class AppException implements Exception {
  const AppException({
    this.code,
    this.message,
    this.defaultMessage = 'エラーが発生しました。',
  });

  final String? code;

  final String? message;

  final String defaultMessage;

  @override
  String toString() {
    if (code == null) {
      return (message ?? '').ifIsEmpty(defaultMessage);
    }
    return '[$code] ${(message ?? '').ifIsEmpty(defaultMessage)}';
  }
}