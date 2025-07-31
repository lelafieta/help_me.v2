import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/community_entity.dart';

abstract class ICommunityRepository {
  Future<Either<Failure, List<CommunityEntity>>> getMyCommunities();
}
