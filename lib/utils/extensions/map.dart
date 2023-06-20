extension MapExtension on Map<String, dynamic>? {
  T? getByKey<T extends Object?>(String key, {bool ignoreError = true}) {
    if (this == null) {
      return null;
    }
    if (!this!.containsKey(key)) {
      if (ignoreError) {
        return null;
      }
      throw Exception('MapExtensionError: $key does not exist.');
    }
    try {
      return this![key] as T;
      // ignore: avoid_catching_errors
    } on Error {
      return null;
    }
  }
}
