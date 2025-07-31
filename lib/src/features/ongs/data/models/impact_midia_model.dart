import '../../domain/entities/impact_midia_entity.dart';

class ImpactMediaModel extends ImpactMediaEntity {
  ImpactMediaModel({
    required super.id,
    required super.impactId,
    required super.mediaUrl,
    required super.mediaType,
  });

  factory ImpactMediaModel.fromJson(Map<String, dynamic> json) {
    return ImpactMediaModel(
      id: json['id'],
      impactId: json['impactId'],
      mediaUrl: json['mediaUrl'],
      mediaType: json['mediaType'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'impactId': impactId,
      'mediaUrl': mediaUrl,
      'mediaType': mediaType,
    };
  }
}
