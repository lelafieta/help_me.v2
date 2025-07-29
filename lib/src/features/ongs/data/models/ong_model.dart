import 'package:utueji/src/features/ongs/data/models/ong_document_model.dart';

import '../../domain/entities/ong_entity.dart';

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

  factory OngModel.fromMap(Map<String, dynamic> map) {
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'about': about,
      'bio': bio,
      'coverImageUrl': coverImageUrl,
      'isVerified': isVerified,
      'mission': mission,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImageUrl': profileImageUrl,
      'servicesNumber': servicesNumber,
      'supportsNumber': supportsNumber,
      'userId': userId,
      'status': status,
      'vision': vision,
    };
  }
}
