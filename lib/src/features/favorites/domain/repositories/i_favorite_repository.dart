import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/favorite_entity.dart';
import '../params/favorite_params.dart';

abstract class IFavoriteRepository {
  Future<Either<Failure, FavoriteEntity>> addFavorite(FavoriteParams favorite);
  Future<Either<Failure, Unit>> removeFavorite(FavoriteParams favorite);
  Future<Either<Failure, bool>> isMyFavorite(String id);
  Future<Either<Failure, List<FavoriteEntity>>> getAllFavotires();
  Future<Either<Failure, List<FavoriteEntity>>> getFavoritesByType(
    String itemType,
  );
}
