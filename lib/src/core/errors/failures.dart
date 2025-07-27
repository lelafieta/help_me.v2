import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;
  final int? statusCode;
  const Failure({this.errorMessage, this.statusCode});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage, super.statusCode});

  factory ServerFailure.fromDioException(DioException dioException) {
    String message = 'An unexpected error occurred.';
    int? statusCode;

    if (dioException.response != null) {
      statusCode = dioException.response!.statusCode;
      if (dioException.response!.data != null &&
          dioException.response!.data is Map) {
        message = dioException.response!.data['message'] ?? message;
      } else if (dioException.response!.data is String) {
        message = dioException.response!.data;
      }
    } else if (dioException.type == DioExceptionType.connectionError) {
      message = 'No internet connection. Please check your network settings.';
    } else if (dioException.type == DioExceptionType.receiveTimeout ||
        dioException.type == DioExceptionType.sendTimeout ||
        dioException.type == DioExceptionType.connectionTimeout) {
      message = 'Connection timed out. Please try again.';
    } else if (dioException.type == DioExceptionType.badResponse) {
      message = 'Bad response from server.';
    } else if (dioException.type == DioExceptionType.cancel) {
      message = 'Request to API server was cancelled.';
    } else if (dioException.type == DioExceptionType.unknown) {
      message = 'An unknown error occurred.';
    }

    return ServerFailure(errorMessage: message, statusCode: statusCode);
  }

  @override
  List<Object?> get props => [errorMessage, statusCode];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object?> get props => [];
}
