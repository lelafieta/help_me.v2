import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/post_entity.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getPostsByCommunityId(
    String communityId,
  );
  
  Future<Either<Failure, List<PostEntity>>> getPostsWithResourcesByCommunity(
    String communityId,
  );

  Future<Either<Failure, List<PostEntity>>> getAllPosts();
}
