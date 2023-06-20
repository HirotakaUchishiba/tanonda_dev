import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'union_timestamp.freezed.dart';

const unionTimestampConverter = _UnionTimestampConverter();

const alwaysUseServerTimestampUnionTimestampConverter =
    _UnionTimestampConverter(alwaysUseServerTimestamp: true);

class _UnionTimestampConverter
    implements JsonConverter<UnionTimestamp, Object> {
  const _UnionTimestampConverter({this.alwaysUseServerTimestamp = false});

  final bool alwaysUseServerTimestamp;

  @override
  UnionTimestamp fromJson(Object json) {
    final timestamp = json as Timestamp;
    return UnionTimestamp.dateTime(timestamp.toDate());
  }

  @override
  Object toJson(UnionTimestamp unionTimestamp) => alwaysUseServerTimestamp
      ? FieldValue.serverTimestamp()
      : unionTimestamp.map(
          dateTime: (unionDateTime) =>
              Timestamp.fromDate(unionDateTime.dateTime),
          serverTimestamp: (_) => FieldValue.serverTimestamp(),
        );
}

@freezed
class UnionTimestamp with _$UnionTimestamp {
  const factory UnionTimestamp.dateTime(DateTime dateTime) = UnionDateTime;

  const factory UnionTimestamp.serverTimestamp() = UnionServerTimestamp;

  const UnionTimestamp._();

  DateTime? get dateTime =>
      mapOrNull(dateTime: (unionDateTime) => unionDateTime.dateTime);
}
