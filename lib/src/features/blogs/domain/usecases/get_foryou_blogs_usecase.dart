import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../../core/usecases/stream_usecase.dart';
import '../entities/blog_entity.dart';
import '../repositories/i_blog_repository.dart';

class GetForYouBlogsUseCase extends BaseUseCase<List<BlogEntity>, NoParams> {
  final IBlogRepository repository;

  GetForYouBlogsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BlogEntity>>> call(NoParams params) {
    return repository.getForYouBlogs();
  }
}
