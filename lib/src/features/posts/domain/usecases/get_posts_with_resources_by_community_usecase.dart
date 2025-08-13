import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/post_entity.dart';
import '../repositories/i_post_repository.dart';

class GetPostsWithResourcesByCommunityUseCase
    extends BaseUseCase<List<PostEntity>, String> {
  final IPostRepository repository;

  GetPostsWithResourcesByCommunityUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PostEntity>>> call(String params) async {
    return repository.getPostsWithResourcesByCommunity(params);
  }
}
