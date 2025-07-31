import '../../../auth/data/models/user_model.dart';
import '../../../ongs/data/models/ong_model.dart';
import '../../domain/entities/feed_entity.dart';
import 'feed_comment_model.dart';
import 'feed_like_model.dart';
import 'feed_view_model.dart';

class FeedModel extends FeedEntity {
  FeedModel({
    super.id,
    super.createdAt,
    super.userId,
    super.ongId,
    super.image,
    super.description,
    super.user,
    super.ong,
    required super.comments,
    required super.likes,
    required super.views,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'created_at': createdAt?.toIso8601String(),
      'user_id': userId,
      'ong_id': ongId,
      'image': image,
      'description': description,
    };
  }

  factory FeedModel.fromJson(Map<String, dynamic> map) {
    return FeedModel(
      id: map['id'] ?? '',
      createdAt: DateTime.parse(
        map['createdAt'] ?? DateTime.now().toIso8601String(),
      ),
      userId: map['userId'] ?? '',
      ongId: map['ongId'] ?? '',
      image: map['image'] ?? '',
      description: map['description'] ?? '',
      user: (map['user'] == null) ? null : UserModel.fromJson(map['user']),
      ong: (map['ong'] == null) ? null : OngModel.fromJson(map['ong']),
      likes: List<FeedLikeModel>.from(
        map['feedLike'].map((x) => FeedLikeModel.fromJson(x)),
      ),
      comments: List<FeedCommentModel>.from(
        map['feedComment'].map((x) => FeedCommentModel.fromJson(x)),
      ),
      views: List<FeedViewModel>.from(
        map['feedView'].map((x) => FeedViewModel.fromJson(x)),
      ),
    );
  }
}
