import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/i_post_repository.dart';

class GetAllPostsUseCase extends BaseUseCase<List<PostEntity>, NoParams> {
  final IPostRepository repository;

  GetAllPostsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return repository.getAllPosts();
  }
}
