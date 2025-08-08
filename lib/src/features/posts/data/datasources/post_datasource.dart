import 'package:dio/dio.dart';
import 'package:utueji/src/features/posts/data/models/post_model.dart';

import 'i_post_datasource.dart';

class PostDataSource extends IPostDataSource {
  final Dio dio;

  PostDataSource({required this.dio});
  @override
  Future<List<PostModel>> getPostsByCommunityId(String communityId) async {
    final response = await dio.get('/posts/community/$communityId');
    return (response.data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<PostModel>> getPostsWithResourcesByCommunityId(
    String communityId,
  ) async {
    final response = await dio.get('/posts/community/resources/$communityId');
    return (response.data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }
}
