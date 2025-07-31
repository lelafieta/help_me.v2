import 'package:dartz/dartz.dart';
import 'package:utueji/src/core/usecases/base_usecase.dart';

import '../../../../core/errors/failures.dart';
import '../entities/post_entity.dart';
import '../repositories/i_post_repository.dart';

class GetPostsByCommunityIdUseCase
    extends BaseUseCase<List<PostEntity>, String> {
  final IPostRepository repository;

  GetPostsByCommunityIdUseCase({required this.repository});

  @override
  Future<Either<Failure, List<PostEntity>>> call(String communityId) async {
    return repository.getPostsByCommunityId(communityId);
  }
}
