import '../../../auth/domain/entities/user_entity.dart';
import '../../../resources/domain/entities/resource_entity.dart';

class PostEntity {
  final String id;
  final String? content;
  final DateTime createdAt;
  final String authorId;
  final String? communityId;
  final String? ongId;
  final List<ResourceEntity> resources;
  final UserEntity user;

  PostEntity({
    required this.id,
    this.content,
    required this.createdAt,
    required this.authorId,
    this.communityId,
    this.ongId,
    required this.resources,
    required this.user,
  });
}
