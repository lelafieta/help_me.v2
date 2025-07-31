import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/feed_comment_entity.dart';
import '../../domain/entities/feed_entity.dart';
import '../../domain/entities/feed_like_entity.dart';
import '../../domain/repositories/i_feed_repository.dart';
import '../datasources/i_feed_datasource.dart';

class FeedRepository extends IFeedRepository {
  final IFeedDataSource feedDataSource;
  final INetWorkInfo netWorkInfo;

  FeedRepository({required this.feedDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, List<FeedEntity>>> fetchFeeds() async {
    if (await netWorkInfo.isConnected == true) {
      try {
        final response = await feedDataSource.fetchFeeds();
        return right(response);
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, FeedCommentEntity>> commentFeed({
    required String feedId,
    required String description,
  }) {
    // TODO: implement commentFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FeedEntity>> createFeed({
    required String description,
    String? imagePath,
  }) {
    // TODO: implement createFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteFeed({required String feedId}) {
    // TODO: implement deleteFeed
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FeedEntity>> getFeedDetail({
    required String feedId,
    required String userId,
    required String ip,
    required String userAgent,
  }) {
    // TODO: implement getFeedDetail
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, FeedLikeEntity>> toggleLikeFeed({
    required String feedId,
  }) {
    // TODO: implement toggleLikeFeed
    throw UnimplementedError();
  }
}
