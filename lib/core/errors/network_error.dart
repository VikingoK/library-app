import 'package:librery_app/core/errors/base_error.dart';

class NetworkError extends BaseError {
  NetworkError({
    super.debugMessage,
    super.errorCode,
    super.errorDescription,
    super.exception,
    super.stackTrace,
  });
}
