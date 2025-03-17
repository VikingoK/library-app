import 'package:dio/dio.dart';

import 'package:either_dart/either.dart';
import 'package:librery_app/core/errors/base_error.dart';
import 'package:librery_app/core/errors/corrupted_data_error.dart';
import 'package:librery_app/core/errors/generic_error.dart';

import 'package:librery_app/core/network/http_client.dart';
import 'package:librery_app/core/errors/auth_token_error.dart';
import 'package:librery_app/core/errors/network_error.dart';
import 'package:librery_app/core/errors/request_server_error.dart';
import 'package:librery_app/core/errors/server_error.dart';

import 'package:flutter/material.dart';

class DioHttpClient implements HttpClient {
  final Dio dio;

  DioHttpClient._internal(this.dio);

  factory DioHttpClient.alpha({required Dio dio}) {
    return DioHttpClient._internal(dio);
  }

  static Dio createDefaultDio(String host) {
    return Dio(
      BaseOptions(
        baseUrl: host,
        headers: {
          "Content-Type": "application/json",
        },
      ),
    )..interceptors.add(
        LogInterceptor(
          request: false,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
          requestBody: true,
          logPrint: (log) => debugPrint(log.toString()),
        ),
      );
  }

  @override
  Future<Either<L, R>> getRequest<L extends BaseError, R>({
    required String endpoint,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
    required R Function(dynamic) builder,
  }) async {
    try {
      final serverResponse = await dio.get(endpoint,
          queryParameters: queryParams, options: Options(headers: headers));

      return _proccessResponse(serverResponse, builder);
    } catch (e, s) {
      return _exceptionHandler(e, s);
    }
  }

  @override
  Future<Response<dynamic>> postRequest({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final serverResponse = await dio.post(endpoint,
        data: body, options: Options(headers: headers));

    return serverResponse.data;
  }

  Future<Either<L, R>> _proccessResponse<L, R>(
      Response<dynamic> response, R Function(dynamic) builder) async {
    final statusCode = response.statusCode;
    if (statusCode != 200 && statusCode != 201) {
      final errorCode = response.data['result'] is List<dynamic>
          ? null
          : response.data['result']?['error_code'];
      final error = GenericError(
        errorCode: errorCode,
        debugMessage: response.data['message'],
        errorDescription: response.data['message'],
      );
      return Left(error as L);
    }

    final responseData = response.data;

    try {
      final model = builder(responseData);

      return Right(model);
    } catch (e) {
      final error = CorruptedDataError(
        debugMessage: 'Corrupted data $e on $response',
      );
      return Left(error as L);
    }
  }

  Future<Either<L, R>> _exceptionHandler<L, R>(Object exception,
      [StackTrace? trace]) async {
    if (exception is DioException) {
      if (exception.type == DioExceptionType.connectionTimeout) {
        final debugMessage =
            'connectionTimeout error on ${exception.requestOptions.uri}, error: $exception';
        return Left(NetworkError(debugMessage: debugMessage) as L);
      }

      if (exception.type == DioExceptionType.badResponse) {
        final statusCode = exception.response?.statusCode;

        if (statusCode != null) {
          if (statusCode >= 500) {
            return Left(ServerError(
                    debugMessage:
                        'Server Error on ${exception.requestOptions.uri}, code: $statusCode, error: $exception')
                as L);
          }
        }

        if (exception.response?.statusCode == 401) {
          return Left(AuthTokenError(
            debugMessage: 'Unauthorized: Token incorrecto',
            errorDescription:
                'Tu sesión ha expirado, debes hacer login nuevamente.',
          ) as L);
        }
        final message = exception.message;
        final debugMessage =
            'badResponse error on ${exception.requestOptions.uri}, error: $exception';
        return Left(RequestServerError(
            debugMessage: debugMessage,
            errorDescription: message,
            errorCode: '${exception.response?.statusCode}') as L);
      }

      final debugMessage =
          'Network error on ${exception.requestOptions.uri}, error: $exception';
      return Left(RequestServerError(
        debugMessage: debugMessage,
        errorDescription: exception.response?.data.toString(),
        exception: exception,
        stackTrace: trace,
      ) as L);
    }
    return Left(RequestServerError(debugMessage: exception.toString()) as L);
  }
}
