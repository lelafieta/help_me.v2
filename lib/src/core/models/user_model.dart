import '../entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.phone,
    required super.fullName,
    required super.firstName,
    required super.lastName,
    required super.avatarUrl,
    required super.roleName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    email: json['email'],
    phone: json['phone'],
    fullName: json['fullName'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    avatarUrl: json['avatarUrl'],
    roleName: json['roleName'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'phone': phone,
    'fullName': fullName,
    'firstName': firstName,
    'lastName': lastName,
    'avatarUrl': avatarUrl,
    'roleName': roleName,
  };
}
