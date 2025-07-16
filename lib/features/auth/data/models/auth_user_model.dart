class AuthUserModel {
  final String id;
  final String email;
  final String? name;
  final String? token;

  AuthUserModel({
    required this.id,
    required this.email,
    this.name,
    this.token,
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'token': token,
    };
  }
}