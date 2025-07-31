import '../models/post_model.dart';

abstract class IPostDataSource {
  Future<List<PostModel>> getPostsByCommunityId(String communityId);
}
