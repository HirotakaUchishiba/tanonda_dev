import 'dart:math';

extension ListExtension<T> on List<T> {
  List<Map<String, dynamic>> get toMaps {
    final maps = <Map<String, dynamic>>[];
    for (final e in this) {
      if (e == null) {
        continue;
      }
      try {
        maps.add(e as Map<String, dynamic>);
      } on Exception {
        continue;
        // ignore: avoid_catching_errors
      } on Error {
        continue;
      }
    }
    return maps;
  }

  T get random => this[Random().nextInt(length)];

  T? getByIndexOrNull(int index) {
    try {
      return this[index];
      // ignore: avoid_catching_errors
    } on RangeError {
      return null;
    }
  }
}
