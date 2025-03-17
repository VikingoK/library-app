import 'package:librery_app/core/errors/base_error.dart';

class GenericError extends BaseError {
  GenericError({
    super.debugMessage,
    super.errorCode,
    super.errorDescription,
    super.exception,
    super.stackTrace,
  });
}
