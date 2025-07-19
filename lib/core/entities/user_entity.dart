import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String phone;
  final String fullName;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final String roleName;

  const UserEntity({
    required this.id,
    required this.email,
    required this.phone,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.roleName,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    phone,
    fullName,
    firstName,
    lastName,
    avatarUrl,
    roleName,
  ];
}
