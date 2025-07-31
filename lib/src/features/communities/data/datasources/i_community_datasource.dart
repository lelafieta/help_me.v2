import '../models/community_model.dart';

abstract class ICommunityDataSource {
  Future<List<CommunityModel>> getMyCommunities();
}
