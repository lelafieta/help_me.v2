import '../../../auth/data/models/user_model.dart';
import '../../domain/entities/impact_entity.dart';
import 'impact_midia_model.dart';

class ImpactModel extends ImpactEntity {
  ImpactModel({
    required super.id,
    required super.title,
    required super.content,
    required super.userId,
    required super.ongId,
    required super.createdAt,
    required super.user,
    required super.medias,
    super.date,
  });

  factory ImpactModel.fromJson(Map<String, dynamic> json) {
    return ImpactModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      userId: json['userId'],
      ongId: json['ongId'],
      date: (json['date'] == null) ? null : DateTime.parse(json['date']),
      createdAt: DateTime.parse(json['createdAt']),
      user: UserModel.fromJson(json['user']),
      medias: (json['medias'] as List)
          .map((m) => ImpactMediaModel.fromJson(m))
          .toList(),
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'title': title,
  //     'content': content,
  //     'userId': userId,
  //     'ongId': ongId,
  //     'createdAt': createdAt.toIso8601String(),
  //     'user': user.toJson(),
  //     'medias': medias.map((m) => m.toJson()).toList(),
  //   };
  // }
}
