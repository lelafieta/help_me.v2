import 'package:equatable/equatable.dart';

class AuthResponseDto extends Equatable {
  final String accessToken;
  final UserDto? user;

  const AuthResponseDto({required this.accessToken, this.user});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(
      accessToken: json['access_token'],
      user: json['user'] != null ? UserDto.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'access_token': accessToken, 'user': user?.toJson()};
  }

  @override
  List<Object?> get props => [accessToken, user];
}

class UserDto extends Equatable {
  final int id;
  final String email;
  final String? firstName;
  final String? lastName;

  final String? avatarUrl;

  const UserDto({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'avatarUrl': avatarUrl,
    };
  }

  @override
  List<Object?> get props => [id, firstName, lastName, email, avatarUrl];
}

class LoginRequestDto extends Equatable {
  final String email;
  final String password;

  const LoginRequestDto({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  @override
  List<Object?> get props => [email, password];
}
