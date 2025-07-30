import 'package:dartz/dartz.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../../core/usecases/stream_usecase.dart';
import '../entities/favorite_entity.dart';
import '../repositories/i_favorite_repository.dart';

class GetAllFavoritesUseCase
    extends BaseUseCase<List<FavoriteEntity>, NoParams> {
  final IFavoriteRepository repository;

  GetAllFavoritesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(NoParams params) {
    return repository.getAllFavotires();
  }
}
