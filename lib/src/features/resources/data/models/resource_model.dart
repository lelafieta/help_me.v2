import '../../domain/entities/resource_entity.dart';

class ResourceModel extends ResourceEntity {
  ResourceModel({
    required super.id,
    required super.title,
    required super.type,
    required super.url,
    required super.uploadedAt,
    super.postId,
    super.communityId,
    required super.uploaderId,
  });

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return ResourceModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
      uploadedAt: DateTime.parse(json['uploadedAt']),
      postId: json['postId'],
      communityId: json['communityId'],
      uploaderId: json['uploaderId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'url': url,
      'uploadedAt': uploadedAt.toIso8601String(),
      'postId': postId,
      'communityId': communityId,
      'uploaderId': uploaderId,
    };
  }
}
