import 'package:equatable/equatable.dart';

class AuthResponseDto extends Equatable {
  final String accessToken;

  const AuthResponseDto({required this.accessToken});

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) {
    return AuthResponseDto(accessToken: json['access_token']);
  }

  Map<String, dynamic> toJson() {
    return {'access_token': accessToken};
  }

  @override
  List<Object?> get props => [accessToken];
}

class UserDto extends Equatable {
  final int id;
  final String firstName;
  final String email;
  final String? avatarUrl;
  final String? bio;
  final String createdAt;
  final String updatedAt;
  final String? location;
  final String? latitude;
  final String? longitude;
  final bool isVerified;
  final String role;
  final int donationQtd;
  final int campaignQtd;
  final String lastName;
  final String fullName;
  final String phoneNumber;

  const UserDto({
    required this.id,
    required this.firstName,
    required this.email,
    this.avatarUrl,
    this.bio,
    required this.createdAt,
    required this.updatedAt,
    this.location,
    this.latitude,
    this.longitude,
    required this.isVerified,
    required this.role,
    required this.donationQtd,
    required this.campaignQtd,
    required this.lastName,
    required this.fullName,
    required this.phoneNumber,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      firstName: json['firstName'],
      email: json['email'],
      avatarUrl: json['avatarUrl'],
      bio: json['bio'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      isVerified: json['isVerified'],
      role: json['role'],
      donationQtd: json['donationQtd'],
      campaignQtd: json['campaignQtd'],
      lastName: json['lastName'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'avatarUrl': avatarUrl,
      'bio': bio,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'isVerified': isVerified,
      'role': role,
      'donationQtd': donationQtd,
      'campaignQtd': campaignQtd,
      'lastName': lastName,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
    };
  }

  @override
  List<Object?> get props => [
    id,
    firstName,
    email,
    avatarUrl,
    bio,
    createdAt,
    updatedAt,
    location,
    latitude,
    longitude,
    isVerified,
    role,
    donationQtd,
    campaignQtd,
    lastName,
    fullName,
    phoneNumber,
  ];
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
