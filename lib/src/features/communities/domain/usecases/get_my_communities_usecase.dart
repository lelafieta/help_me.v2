import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/community_entity.dart';
import '../repositories/i_community_repository.dart';

class GetMyCommunitiesUseCase
    extends BaseUseCase<List<CommunityEntity>, NoParams> {
  final ICommunityRepository repository;

  GetMyCommunitiesUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CommunityEntity>>> call(NoParams params) {
    return repository.getMyCommunities();
  }
}
