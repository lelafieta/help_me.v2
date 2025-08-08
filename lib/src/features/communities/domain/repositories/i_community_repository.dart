import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/community_entity.dart';
import '../entities/community_member_entity.dart';

abstract class ICommunityRepository {
  Future<Either<Failure, List<CommunityEntity>>> getMyCommunities();
  Future<Either<Failure, List<CommunityMemberEntity>>> getMembersByCommunity(
    String communityId,
  );
}
