class BaseError {
  const BaseError({
    this.exception,
    this.stackTrace,
    this.debugMessage,
    this.errorCode,
    this.errorDescription,
  });

  final dynamic exception;
  final StackTrace? stackTrace;
  final String? debugMessage;
  final String? errorCode;
  final String? errorDescription;

  @override
  String toString() =>
      '$runtimeType (debugMessage: $debugMessage, errorCode: $errorCode, errorDescription: $errorDescription)';
}
