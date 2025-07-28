import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/category_entity.dart';

abstract class ICategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories();
}
