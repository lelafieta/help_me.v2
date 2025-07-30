import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/favorite_entity.dart';
import '../params/favorite_params.dart';
import '../repositories/i_favorite_repository.dart';

class AddFavoriteUseCase extends BaseUseCase<FavoriteEntity, FavoriteParams> {
  final IFavoriteRepository repository;

  AddFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, FavoriteEntity>> call(FavoriteParams params) async {
    return await repository.addFavorite(params);
  }
}
