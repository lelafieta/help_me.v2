import '../../domain/entities/community_member_entity.dart';
import '../models/community_model.dart';

abstract class ICommunityDataSource {
  Future<List<CommunityModel>> getMyCommunities();
  Future<List<CommunityMemberEntity>> getMembersByCommunity(String communityId);
}
