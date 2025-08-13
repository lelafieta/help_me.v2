import '../../domain/entities/view_entity.dart';

class ViewModel extends ViewEntity {
  const ViewModel({
    required super.id,
    super.userId,
    super.ipAddress,
    required super.createdAt,
    super.postId,
    super.blogId,
    super.feedId,
  });

  factory ViewModel.fromJson(Map<String, dynamic> json) {
    return ViewModel(
      id: json['id'],
      userId: json['userId'],
      ipAddress: json['ipAddress'],
      createdAt: DateTime.parse(json['createdAt']),
      postId: json['postId'],
      blogId: json['blogId'],
      feedId: json['feedId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'ipAddress': ipAddress,
      'createdAt': createdAt.toIso8601String(),
      'postId': postId,
      'blogId': blogId,
      'feedId': feedId,
    };
  }
}
