import '../models/feed_model.dart';
import '../models/feed_comment_model.dart';
import '../models/feed_like_model.dart';

abstract class IFeedDataSource {
  Future<List<FeedModel>> fetchFeeds();

  Future<FeedModel> getFeedDetail({
    required String feedId,
    required String userId,
    required String ip,
    required String userAgent,
  });

  Future<FeedModel> createFeed({
    required String description,
    String? imagePath,
  });

  Future<FeedCommentModel> commentFeed({
    required String feedId,
    required String description,
  });

  Future<FeedLikeModel> toggleLikeFeed({required String feedId});

  Future<void> deleteFeed({required String feedId});
}
