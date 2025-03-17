import 'package:librery_app/core/errors/base_error.dart';

class AuthTokenError extends BaseError {
  AuthTokenError({
    super.debugMessage,
    super.errorCode,
    super.errorDescription,
    super.exception,
    super.stackTrace,
  });
}
