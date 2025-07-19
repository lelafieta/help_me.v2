import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/repositories/favorite_repository.dart';
import '../entities/favorite_entity.dart';


class AddFavoriteUseCase extends UseCase<Unit, FavoriteEntity> {
  final FavoriteRepository repository;

  AddFavoriteUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(FavoriteEntity params) async {
    return await repository.addFavorite(params);
  }
}
