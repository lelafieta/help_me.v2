import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/favorite_entity.dart';
import '../repositories/i_favorite_repository.dart';

class GetFavoritesByTypeUseCase
    extends BaseUseCase<List<FavoriteEntity>, String> {
  final IFavoriteRepository repository;

  GetFavoritesByTypeUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FavoriteEntity>>> call(String params) {
    return repository.getFavoritesByType(params);
  }
}
