import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../params/favorite_params.dart';
import '../repositories/i_favorite_repository.dart';

class RemoveFavoriteUseCase extends BaseUseCase<Unit, FavoriteParams> {
  final IFavoriteRepository repository;

  RemoveFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(FavoriteParams params) async {
    return await repository.removeFavorite(params);
  }
}
