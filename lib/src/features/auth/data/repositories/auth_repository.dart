import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/features/auth/data/dto/login_dto.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_auth_repository.dart';
import '../../params/login_request_params.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/i_auth_datasource.dart';

class AuthRespository extends IAuthRepository {
  final INetWorkInfo netWorkInfo;
  final IAuthDataSource authDataSource;
  final IAuthLocalDataSource localDataSource;

  AuthRespository({
    required this.netWorkInfo,
    required this.authDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, AuthResponseEntity>> signIn(
    LoginRequestParams loginRequest,
  ) async {
    if (await netWorkInfo.isConnected) {
      try {
        AuthResponseEntity authResponse = await authDataSource.signIn(
          LoginRequestDto(
            email: loginRequest.email,
            password: loginRequest.password,
          ),
        );

        await localDataSource.cacheToken(authResponse.accessToken);
        await localDataSource.cacheUserFirstName(authResponse.user.firstName);
        await localDataSource.cacheUserLastName(authResponse.user.lastName);
        await localDataSource.cacheUserAvatar(authResponse.user.avatarUrl);
        return Right(authResponse);
      } on DioException catch (e, s) {
        print("error $s $e");
        return Left(ServerFailure.fromDioException(e));
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      print("object");
      return Left(ServerFailure(errorMessage: "Sem Internet"));
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await authDataSource.signOut();
      return Right(unit);
    } catch (e) {
      debugPrint("object ${e}");
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> signInWithOtp(String phone) async {
    try {
      await authDataSource.signInWithOtp(phone);
      return Right(unit);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> authUser() async {
    try {
      UserEntity? response = await authDataSource.authUser();
      return Right(response);
    } catch (e) {
      debugPrint("object ${e}");
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() {
    // TODO: implement clearToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> clearUserData() {
    // TODO: implement clearUserData
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String?>> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String?>> getUserAvatar() {
    // TODO: implement getUserAvatar
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String?>> getUserName() {
    // TODO: implement getUserName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }
}
