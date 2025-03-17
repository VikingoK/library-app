import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';

abstract class HttpClient {
  Future<Either<L, R>> getRequest<L extends BaseError, R>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    required R Function(dynamic) builder,
  });

  Future<dynamic> postRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  });
}
