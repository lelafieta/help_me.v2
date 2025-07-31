import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/post_entity.dart';

abstract class IPostRepository {
  Future<Either<Failure, List<PostEntity>>> getPostsByCommunityId(
    String communityId,
  );
}
