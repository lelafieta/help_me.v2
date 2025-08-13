import '../../../auth/data/models/user_model.dart';
import '../../../comments/data/models/comment_model.dart';
import '../../../communities/data/models/community_model.dart';
import '../../../likes/data/models/like_model.dart';
import '../../../ongs/data/models/ong_model.dart';
import '../../../resources/data/models/resource_model.dart';
import '../../../shares/data/models/share_model.dart';
import '../../../views/data/models/view_model.dart';
import '../../domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    required super.id,
    super.content,
    required super.createdAt,
    super.userId,
    super.communityId,
    super.ongId,
    super.user,
    super.community,
    super.ong,
    super.resources = const [],
    super.views = const [],
    super.comments = const [],
    super.likes = const [],
    super.shares = const [],
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      userId: json['userId'],
      communityId: json['communityId'],
      ongId: json['ongId'],
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
        community: json['community'] != null
            ? CommunityModel.fromJson(json['community'])
            : null,
      ong: json['ong'] != null ? OngModel.fromJson(json['ong']) : null,
      resources:
          (json['resources'] as List<dynamic>?)
              ?.map((e) => ResourceModel.fromJson(e))
              .toList() ??
          [],
      views:
          (json['views'] as List<dynamic>?)
              ?.map((e) => ViewModel.fromJson(e))
              .toList() ??
          [],
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentModel.fromJson(e))
              .toList() ??
          [],
      likes:
          (json['likes'] as List<dynamic>?)
              ?.map((e) => LikeModel.fromJson(e))
              .toList() ??
          [],
      shares:
          (json['shares'] as List<dynamic>?)
              ?.map((e) => ShareModel.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
      'communityId': communityId,
      'ongId': ongId,
      'user': user != null && user is UserModel
          ? (user as UserModel).toJson()
          : null,
      'community': community != null && community is CommunityModel
          ? (community as CommunityModel).toString()
          : null,
      'ong': ong != null && ong is OngModel ? (ong as OngModel).toMap() : null,
      'resources': resources.map((e) => (e as ResourceModel).toJson()).toList(),
      'views': views.map((e) => (e as ViewModel).toJson()).toList(),
      'comments': comments.map((e) => (e as CommentModel).toJson()).toList(),
      'likes': likes.map((e) => (e as LikeModel).toJson()).toList(),
      'shares': shares.map((e) => (e as ShareModel).toJson()).toList(),
    };
  }
}
