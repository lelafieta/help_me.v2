import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';

import '../entities/blog_entity.dart';
import '../repositories/i_blog_repository.dart';

class GetFeaturedBlogsUseCase extends BaseUseCase<List<BlogEntity>, NoParams> {
  final IBlogRepository repository;

  GetFeaturedBlogsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BlogEntity>>> call(NoParams params) {
    return repository.getFeaturedBlogs();
  }
}
