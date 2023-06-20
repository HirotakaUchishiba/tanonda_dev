extension DynamicExtension on dynamic {
  bool get toBool {
    if (this == null) {
      return false;
    }
    if (this is bool) {
      return this as bool;
    }
    if (this is int) {
      return this == 0;
    }
    if (this is String) {
      return this == '1' || this == 'true' || this == 'True' || this == 'TRUE';
    }
    return false;
  }
}