import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class Failure extends Equatable {
  const Failure({this.errorMessage, this.statusCode});

  final String? errorMessage;
  final int? statusCode;

  @override
  List<Object> get props => [errorMessage!, statusCode!];
}

class ServerFailure extends Failure {
  const ServerFailure({super.errorMessage, super.statusCode});

  factory ServerFailure.fromDioException(DioException dioException) {
    String message = 'An unexpected error occurred.';
    int? statusCode;

    if (dioException.response != null) {
      statusCode = dioException.response!.statusCode;
      if (dioException.response!.data is Map) {
        message = dioException.response!.data['message'] ?? message;
      } else {
        message = dioException.response!.statusMessage ?? message;
      }
    } else {
      switch (dioException.type) {
        case DioExceptionType.connectionTimeout:
          message = 'Connection timeout with API server.';
          break;
        case DioExceptionType.sendTimeout:
          message = 'Send timeout in connection with API server.';
          break;
        case DioExceptionType.receiveTimeout:
          message = 'Receive timeout in connection with API server.';
          break;
        case DioExceptionType.badResponse:
          message = 'Bad response from API server.';
          break;
        case DioExceptionType.cancel:
          message = 'Request to API server was cancelled.';
          break;
        case DioExceptionType.unknown:
          message = 'No internet connection or unknown error.';
          break;
        case DioExceptionType.badCertificate:
          message = 'Bad SSL certificate.';
          break;
        case DioExceptionType.connectionError:
          message = 'Connection error.';
          break;
      }
    }
    return ServerFailure(errorMessage: message, statusCode: 500);
  }
}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {
  const NetworkFailure({super.errorMessage, super.statusCode});
}
