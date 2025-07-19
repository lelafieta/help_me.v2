import 'package:dio/dio.dart';
import 'package:help_me/core/error/failures.dart';

class ServerException extends DioException implements Exception {
  ServerException({
    required RequestOptions requestOptions,
    Response? response,
    DioExceptionType type = DioExceptionType.unknown,
    dynamic error,
    StackTrace? stackTrace,
  }) : super(
         requestOptions: requestOptions,
         response: response,
         type: type,
         error: error,
         stackTrace: stackTrace,
       );

  factory ServerException.fromDioException(DioException dioException) {
    return ServerException(
      requestOptions: dioException.requestOptions,
      response: dioException.response,
      type: dioException.type,
      error: dioException.error,
      stackTrace: dioException.stackTrace,
    );
  }
}

class CacheException implements Exception {}
