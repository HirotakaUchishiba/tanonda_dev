import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const timestampConverter = TimestampConverter();
const timestampIntConverter = TimestampIntConverter();

/// Firestore の Timestamp 型 と Dart の DateTime 型とを変換するコンバータ。
class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  /// toJson、つまり、書き込みのためにインスタンスを生成してドキュメント化する時は
  /// TimestampConverter のフィールドは FieldValue.serverTimestamp() に自動で置換する。
  @override
  dynamic toJson(DateTime? dateTime) =>
      dateTime == null ? null : Timestamp.fromDate(dateTime);
}

/// Firestore の Timestamp 型 と int 型（ミリ秒単位のUNIXタイムスタンプ）とを変換するコンバータ。
class TimestampIntConverter implements JsonConverter<Timestamp, int> {
  const TimestampIntConverter();

  @override
  Timestamp fromJson(int json) {
    return Timestamp.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;
}
