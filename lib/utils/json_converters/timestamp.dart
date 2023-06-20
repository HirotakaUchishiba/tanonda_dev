import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

const timestampConverter = TimestampConverter();
const timestampIntConverter = TimestampIntConverter();

class TimestampConverter implements JsonConverter<DateTime?, dynamic> {
  const TimestampConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  @override
  dynamic toJson(DateTime? dateTime) =>
      dateTime == null ? null : Timestamp.fromDate(dateTime);
}

class TimestampIntConverter implements JsonConverter<Timestamp, int> {
  const TimestampIntConverter();

  @override
  Timestamp fromJson(int json) {
    return Timestamp.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(Timestamp timestamp) => timestamp.millisecondsSinceEpoch;
}
