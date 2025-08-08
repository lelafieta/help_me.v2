import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/community_member_entity.dart';
import '../repositories/i_community_repository.dart';

class GetMembersByCommunityIdUseCase
    extends BaseUseCase<List<CommunityMemberEntity>, String> {
  final ICommunityRepository repository;

  GetMembersByCommunityIdUseCase({required this.repository});

  @override
  Future<Either<Failure, List<CommunityMemberEntity>>> call(String params) {
    return repository.getMembersByCommunity(params);
  }
}
