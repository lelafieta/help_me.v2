import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../../comments/domain/entities/comment_entity.dart';
import '../../../communities/domain/entities/community_entity.dart';
import '../../../likes/domain/entities/like_entity.dart';
import '../../../ongs/domain/entities/ong_entity.dart';
import '../../../resources/domain/entities/resource_entity.dart';
import '../../../shares/domain/entities/share_entity.dart';
import '../../../views/domain/entities/view_entity.dart';

class PostEntity extends Equatable {
  final String id;
  final String? content;
  final DateTime createdAt;
  final String? userId;
  final String? communityId;
  final String? ongId;

  final UserEntity? user;
  final CommunityEntity? community;
  final OngEntity? ong;
  final List<ResourceEntity> resources;
  final List<ViewEntity> views;
  final List<CommentEntity> comments;
  final List<LikeEntity> likes;
  final List<ShareEntity> shares;

  const PostEntity({
    required this.id,
    this.content,
    required this.createdAt,
    this.userId,
    this.communityId,
    this.ongId,
    this.user,
    this.community,
    this.ong,
    this.resources = const [],
    this.views = const [],
    this.comments = const [],
    this.likes = const [],
    this.shares = const [],
  });

  @override
  List<Object?> get props => [
    id,
    content,
    createdAt,
    userId,
    communityId,
    ongId,
    user,
    community,
    ong,
    resources,
    views,
    comments,
    likes,
    shares,
  ];
}
