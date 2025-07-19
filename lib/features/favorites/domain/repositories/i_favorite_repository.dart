import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/favorite_entity.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, Unit>> addFavorite(FavoriteEntity favorite);
  Future<Either<Failure, Unit>> removeFavorite(FavoriteEntity favorite);
  Future<Either<Failure, bool>> isMyFavorite(String id);
  Future<Either<Failure, List<FavoriteEntity>>> getAllFavotires();
  Future<Either<Failure, List<FavoriteEntity>>> getFavoriteByType();
}
