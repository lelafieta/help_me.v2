import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/features/categories/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}
