import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category_entity.dart';
import '../repositories/i_category_repository.dart';

class GetAllCategoriesUsecase extends UseCase<List<CategoryEntity>, NoParams> {
  final ICategoryRepository repository;

  GetAllCategoriesUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) {
    return repository.getAllCategories();
  }
}
