import 'package:dartz/dartz.dart';

import '../dto/login_dto.dart';
import '../models/auth_response_model.dart';
import '../models/user_model.dart';

abstract class IAuthDataSource {
  Future<AuthResponseModel> signIn(LoginRequestDto loginDto);
  Future<UserModel?> signUp(String email, String password);
  Future<Unit> signInWithOtp(String phone);
  Future<UserModel> authUser();
  Future<Unit> signOut();
  Future<bool> isSignIn();
}
