import 'package:librery_app/core/errors/base_error.dart';

class ServerError extends BaseError {
  ServerError({
    super.debugMessage,
    super.errorCode,
    super.errorDescription,
    super.exception,
    super.stackTrace,
  });
}
