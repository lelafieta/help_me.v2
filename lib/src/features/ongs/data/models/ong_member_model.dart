import '../../../auth/data/models/user_model.dart';
import '../../domain/entities/ong_member_entity.dart';

class OngMemberModel extends OngMemberEntity {
  OngMemberModel({
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    required super.name,
    required super.role,
    required super.email,
    required super.phone,
    required super.ongId,
    required super.userId,
    required UserModel user,
  }) : super(user: user);

  factory OngMemberModel.fromJson(Map<String, dynamic> json) {
    return OngMemberModel(
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      name: json['name'],
      role: json['role'],
      email: json['email'],
      phone: json['phone'],
      ongId: json['ongId'],
      userId: json['userId'],
      user: UserModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'name': name,
      'role': role,
      'email': email,
      'phone': phone,
      'ongId': ongId,
      'userId': userId,
      // 'user': user.toJson(),
    };
  }
}
