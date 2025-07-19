import 'package:equatable/equatable.dart';

class LoginRequestParams extends Equatable {
  final String email;
  final String password;

  const LoginRequestParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
