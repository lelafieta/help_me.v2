import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/blog_entity.dart';

abstract class IBlogRepository {
  Future<Either<Failure, List<BlogEntity>>> getFeaturedBlogs();
  Future<Either<Failure, List<BlogEntity>>> getForYouBlogs();
}
