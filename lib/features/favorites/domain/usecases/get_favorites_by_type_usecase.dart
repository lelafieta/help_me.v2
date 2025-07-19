import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/favorite_entity.dart';
import '../repositories/i_favorite_repository.dart';

class GetFavoritesByTypeUseCase
    extends UseCase<List<FavoriteEntity>, NoParams> {
  final IFavoriteRepository repository;

  GetFavoritesByTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(NoParams params) {
    return repository.getFavoriteByType();
  }
}
