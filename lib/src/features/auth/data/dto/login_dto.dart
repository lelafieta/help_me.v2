import 'package:equatable/equatable.dart';

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
