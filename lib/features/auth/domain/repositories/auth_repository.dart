import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/network/network_info.dart';
import 'package:help_me/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:help_me/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:help_me/features/auth/data/models/auth_dto.dart';
import 'package:help_me/core/error/exceptions.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseDto>> login(LoginRequestDto loginRequest);
  Future<Either<Failure, String?>> getToken();
  Future<Either<Failure, String?>> getUserName();
  Future<Either<Failure, String?>> getUserAvatar();
  Future<Either<Failure, void>> clearToken();
  Future<Either<Failure, void>> clearUserData();
}

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
  Future<Either<Failure, AuthResponseDto>> login(
    LoginRequestDto loginRequest,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final authResponse = await remoteDataSource.login(loginRequest);

        await localDataSource.cacheToken(authResponse.accessToken);
        if (authResponse.user != null) {
          await localDataSource.cacheUserFirstName(
            authResponse.user!.firstName ?? '',
          );
          await localDataSource.cacheUserLastName(
            authResponse.user!.lastName ?? '',
          );
          await localDataSource.cacheUserAvatar(
            authResponse.user!.avatarUrl ?? '',
          );
        }
        return Right(authResponse);
      } on ServerException catch (e) {
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
