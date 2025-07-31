import 'package:utueji/src/features/ongs/data/models/impact_model.dart';
import 'package:utueji/src/features/ongs/data/models/ong_document_model.dart';

import '../../domain/entities/ong_entity.dart';
import 'ong_member_model.dart';

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
    super.ongMember,
    super.impacts,
  });

  factory OngModel.fromJson(Map<String, dynamic> json) {
    return OngModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'])
          : null,
      about: json['about'],
      bio: json['bio'],
      coverImageUrl: json['coverImageUrl'],
      isVerified: json['isVerified'] == true,
      mission: json['mission'],
      name: json['name'],
      email: json['email'],
      status: json['status'],
      website: json['website'],
      phoneNumber: json['phoneNumber'],
      profileImageUrl: json['profileImageUrl'],
      servicesNumber: json['servicesNumber'],
      supportsNumber: json['supportsNumber']?.toDouble(),
      userId: json['userId'],
      vision: json['vision'],
      ongDocument: (json['ongDocument'] != null)
          ? OngDocumentModel.fromJson(json['ongDocument'])
          : json['ongDocument'],
      ongMember: (json['ongMember'] != null)
          ? List<OngMemberModel>.from(
              json['ongMember'].map((x) => OngMemberModel.fromJson(x)),
            )
          : null,

      impacts: (json['impacts'] != null)
          ? List<ImpactModel>.from(
              json['impacts'].map((x) => ImpactModel.fromJson(x)),
            )
          : null,
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
