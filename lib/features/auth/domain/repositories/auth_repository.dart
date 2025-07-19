import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import '../entities/auth_response_entity.dart';
import '../params/login_request_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginRequestParams loginRequest,
  );
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, String?>> getUserName();
  Future<Either<Failure, String?>> getUserAvatar();
  Future<Either<Failure, void>> clearToken();
  Future<Either<Failure, void>> clearUserData();
}
