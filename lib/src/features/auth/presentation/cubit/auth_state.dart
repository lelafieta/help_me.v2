import '../../domain/entities/auth_response_entity.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final AuthResponseEntity? authResponse;
  Authenticated({required this.authResponse});
}

class AuthOtpSendSms extends AuthState {}

class AuthFailure extends AuthState {
  final String failure;
  AuthFailure({required this.failure});
}

class AuthSignedOut extends AuthState {}
