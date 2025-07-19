import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/repositories/i_favorite_repository.dart';
import '../datasources/i_favorite_datasource.dart';
import '../models/favorite_model.dart';

class FavoriteRepository extends IFavoriteRepository {
  final IFavoriteDataSource favoriteDataSource;
  final INetworkInfo networkInfo;

  FavoriteRepository({
    required this.favoriteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Unit>> addFavorite(FavoriteEntity favorite) async {
    if (await networkInfo.isConnected) {
      final response = await favoriteDataSource.addFavorite(
        FavoriteModel.fromEntity(favorite),
      );
      return Right(response);
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getAllFavotires() async {
    if (await networkInfo.isConnected) {
      final response = await favoriteDataSource.getAllFavotires();
      return Right(response);
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByType() async {
    if (await networkInfo.isConnected) {
      final response = await favoriteDataSource.getFavoriteByType();
      return Right(response);
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, bool>> isMyFavorite(String id) async {
    if (await networkInfo.isConnected) {
      final response = await favoriteDataSource.isMyFavorite(id);
      return Right(response);
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(FavoriteEntity favorite) async {
    try {
      final response = await favoriteDataSource.removeFavorite(
        FavoriteModel.fromEntity(favorite),
      );
      return Right(response);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
