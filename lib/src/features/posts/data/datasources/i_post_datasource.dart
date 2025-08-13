import '../models/post_model.dart';

abstract class IPostDataSource {
  Future<List<PostModel>> getPostsByCommunityId(String communityId);
  Future<List<PostModel>> getPostsWithResourcesByCommunityId(
    String communityId,
  );
  Future<List<PostModel>> getAllPosts();
}
