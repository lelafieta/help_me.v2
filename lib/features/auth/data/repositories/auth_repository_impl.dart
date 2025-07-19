import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/auth_response_entity.dart';
import '../../domain/params/login_request_params.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../dto/login_dto.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AuthResponseEntity>> login(
    LoginRequestParams loginRequest,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await remoteDataSource.login(
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
      } on DioException catch (e) {
        return Left(ServerFailure.fromDioException(e));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getUserName() async {
    try {
      final name = await localDataSource.getUserFirstName();
      return Right(name);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String?>> getUserAvatar() async {
    try {
      final avatar = await localDataSource.getUserAvatar();
      return Right(avatar);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      await localDataSource.clearToken();
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> clearUserData() async {
    try {
      await localDataSource.clearUserFirstName();
      await localDataSource.clearUserLastName();
      await localDataSource.clearUserAvatar();
      return const Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
