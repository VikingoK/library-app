import 'package:librery_app/core/errors/base_error.dart';

class CorruptedDataError extends BaseError {
  CorruptedDataError({
    super.debugMessage,
    super.errorCode,
    super.errorDescription,
    super.exception,
    super.stackTrace,
  });
}
