import '../../domain/ong_entity.dart';
import 'ong_document_model.dart';

class OngModel extends OngEntity {
  OngModel({
    super.id,
    super.createdAt,
    super.updatedAt,
    super.about,
    super.bio,
    super.coverImageUrl,
    super.isVerified,
    super.status,
    super.mission,
    super.name,
    super.email,
    super.website,
    super.phoneNumber,
    super.profileImageUrl,
    super.servicesNumber,
    super.supportsNumber,
    super.userId,
    super.vision,
    super.ongDocument,
  });

  factory OngModel.fromJson(Map<String, dynamic> map) {
    return OngModel(
      id: map['id'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'])
          : null,
      about: map['about'],
      bio: map['bio'],
      coverImageUrl: map['coverImageUrl'],
      isVerified: map['isVerified'] == true,
      mission: map['mission'],
      name: map['name'],
      email: map['email'],
      status: map['status'],
      website: map['website'],
      phoneNumber: map['phoneNumber'],
      profileImageUrl: map['profileImageUrl'],
      servicesNumber: map['servicesNumber'],
      supportsNumber: map['supportsNumber']?.toDouble(),
      userId: map['userId'],
      vision: map['vision'],
      ongDocument: (map['ongDocument'] != null)
          ? OngDocumentModel.fromMap(map['ongDocument'])
          : map['ongDocument'],
    );
  }
}
