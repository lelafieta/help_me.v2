import 'package:dartz/dartz.dart';
import 'package:utueji/src/features/auth/domain/entities/auth_response_entity.dart';
import 'package:utueji/src/features/auth/params/login_request_params.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, AuthResponseEntity>> signIn(
    LoginRequestParams loginRequest,
  );
  Future<Either<Failure, UserEntity>> signUp(String email, String password);
  Future<Either<Failure, Unit>> signOut();
  Future<Either<Failure, Unit>> signInWithOtp(String phone);
  Future<Either<Failure, bool>> isSignedIn();
  Future<Either<Failure, UserEntity>> authUser();

  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, String?>> getUserName();
  Future<Either<Failure, String?>> getUserAvatar();
  Future<Either<Failure, void>> clearToken();
  Future<Either<Failure, void>> clearUserData();
}
