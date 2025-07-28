import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.id,
    super.fullName,
    super.email,
    super.avatarUrl,
    super.phoneNumber,
    super.bio,
    super.createdAt,
    super.updatedAt,
    super.location,
    super.isVerified,
    super.role,
    super.firstName,
    super.lastName,
    super.userFcmTokenEntity,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    print("CREATED AT ${json['createdAt']}");
    return UserModel(
      id: json['id'],
      fullName: json['fullName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      phoneNumber: json['phone'],
      bio: json['bio'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      location: json['location'],
      isVerified: json['isVerified'],
      role: json['roleName'],
      userFcmTokenEntity: json['userFcm'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'avatar_url': avatarUrl,
      'phone_number': phoneNumber,
      'bio': bio,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'location': location,
      'is_verified': isVerified,
      'role': role,
      //  'user_fcm': userFcmTokenEntity.t
    };
  }

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? avatarUrl,
    String? phoneNumber,
    String? bio,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? location,
    bool? isVerified,
    String? role,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      bio: bio ?? this.bio,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      location: location ?? this.location,
      isVerified: isVerified ?? this.isVerified,
      role: role ?? this.role,
      userFcmTokenEntity: userFcmTokenEntity ?? this.userFcmTokenEntity,
    );
  }
}
