import '../constants/string.dart';
import 'base.dart';

class ApiException extends AppException implements Exception {
  const ApiException({
    super.code,
    super.message,
    super.defaultMessage = serverConnectionFailure,
  });
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({super.message})
      : super(
          code: '401',
          defaultMessage: '認証されていません。',
        );
}

class ForbiddenException extends ApiException {
  const ForbiddenException({super.message})
      : super(
          code: '403',
          defaultMessage: '指定した操作を行う権限がありません。',
        );
}

class ApiNotFoundException extends ApiException {
  const ApiNotFoundException({super.message})
      : super(
          code: '404',
          defaultMessage: 'リクエストした API が見つかりませんでした。',
        );
}

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException({super.message})
      : super(
          defaultMessage: 'API 通信がタイムアウトしました。'
              '通信環境をご確認のうえ、再度実行してください。',
        );
}

class NetworkNotConnectedException extends ApiException {
  const NetworkNotConnectedException({super.message})
      : super(
          defaultMessage: 'ネットワーク接続がありません。',
        );
}