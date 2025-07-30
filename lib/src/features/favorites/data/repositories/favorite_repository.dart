import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:utueji/src/core/network/i_network_info.dart';
import 'package:utueji/src/features/favorites/data/dto/favorite_dto.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/favorite_entity.dart';
import '../../domain/params/favorite_params.dart';
import '../../domain/repositories/i_favorite_repository.dart';
import '../datasources/i_favorite_datasource.dart';
import '../models/favorite_model.dart';

class FavoriteRepository extends IFavoriteRepository {
  final IFavoriteDataSource favoriteDataSource;
  final INetWorkInfo netWorkInfo;

  FavoriteRepository({
    required this.favoriteDataSource,
    required this.netWorkInfo,
  });
  @override
  Future<Either<Failure, FavoriteEntity>> addFavorite(
    FavoriteParams favorite,
  ) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.addFavorite(
          FavoriteDto(itemId: favorite.itemId, itemType: favorite.itemType),
        );
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getAllFavotires() async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.getAllFavotires();
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, bool>> isMyFavorite(String id) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.isMyFavorite(id);
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<FavoriteEntity>>> getFavoritesByType(
    String itemType,
  ) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await favoriteDataSource.getFavoritesByType(itemType);
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(FavoriteParams favorite) async {
    if (await netWorkInfo.isConnected) {
      try {
        await favoriteDataSource.removeFavorite(
          FavoriteDto(itemId: favorite.itemId, itemType: favorite.itemType),
        );
        return right(unit);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }
}
