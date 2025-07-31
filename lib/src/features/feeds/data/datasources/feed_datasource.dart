import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:utueji/src/features/feeds/data/models/feed_comment_model.dart';
import 'package:utueji/src/features/feeds/data/models/feed_like_model.dart';
import 'package:utueji/src/features/feeds/data/models/feed_model.dart';

import '../../../../core/supabase/supabase_consts.dart';
import 'i_feed_datasource.dart';

class FeedDataSource extends IFeedDataSource {
  final Dio dio;

  FeedDataSource({required this.dio});

  @override
  Future<FeedCommentModel> commentFeed({
    required String feedId,
    required String description,
  }) {
    // TODO: implement commentFeed
    throw UnimplementedError();
  }

  @override
  Future<FeedModel> createFeed({
    required String description,
    String? imagePath,
  }) {
    // TODO: implement createFeed
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFeed({required String feedId}) {
    // TODO: implement deleteFeed
    throw UnimplementedError();
  }

  @override
  Future<List<FeedModel>> fetchFeeds() async {
    final response = await dio.get('/feeds');
    return (response.data as List)
        .map((json) => FeedModel.fromJson(json))
        .toList();
  }

  @override
  Future<FeedModel> getFeedDetail({
    required String feedId,
    required String userId,
    required String ip,
    required String userAgent,
  }) {
    // TODO: implement getFeedDetail
    throw UnimplementedError();
  }

  @override
  Future<FeedLikeModel> toggleLikeFeed({required String feedId}) {
    // TODO: implement toggleLikeFeed
    throw UnimplementedError();
  }
}
