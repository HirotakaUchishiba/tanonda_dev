import 'constants/map.dart';

Map<String, dynamic> toResponseJson(dynamic data) {
  if (data == null) {
    return emptyMap;
  }
  if (data is List) {
    return <String, dynamic>{'items': data};
  }
  if (data is Map) {
    return data as Map<String, dynamic>;
  }

  return emptyMap;
}

enum ErrorCode {
  networkNotConnected,
}
