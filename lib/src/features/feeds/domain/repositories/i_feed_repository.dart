import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/feed_entity.dart';
import '../entities/feed_comment_entity.dart';
import '../entities/feed_like_entity.dart';

abstract class IFeedRepository {
  Future<Either<Failure, List<FeedEntity>>> fetchFeeds();

  Future<Either<Failure, FeedEntity>> getFeedDetail({
    required String feedId,
    required String userId,
    required String ip,
    required String userAgent,
  });

  Future<Either<Failure, FeedEntity>> createFeed({
    required String description,
    String? imagePath, // caminho local do arquivo
  });

  Future<Either<Failure, FeedCommentEntity>> commentFeed({
    required String feedId,
    required String description,
  });

  Future<Either<Failure, FeedLikeEntity>> toggleLikeFeed({
    required String feedId,
  });

  Future<Either<Failure, Unit>> deleteFeed({required String feedId});
}
