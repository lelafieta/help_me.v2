import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:utueji/src/core/supabase/supabase_consts.dart';
import 'package:utueji/src/features/auth/data/dto/login_dto.dart';
import 'package:utueji/src/features/auth/data/models/auth_response_model.dart';

import '../../../../core/errors/failures.dart';
import '../models/user_model.dart';
import 'i_auth_datasource.dart';

class AuthDataSource implements IAuthDataSource {
  final SupabaseClient supabase;
  final Dio dio;

  AuthDataSource({required this.supabase, required this.dio});
  @override
  Future<bool> isSignIn() async {
    return supabase.auth.currentUser != null;
  }

  @override
  Future<Unit> signOut() async {
    try {
      await supabase.auth.signOut();
      return unit;
    } catch (e) {
      throw ServerFailure(errorMessage: 'Erro ao fazer logout');
    }
  }

  @override
  Future<UserModel?> signUp(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> signInWithOtp(String phone) async {
    try {
      await supabase.auth.signInWithOtp(phone: phone);
      return unit;
    } catch (e) {
      print(e);
      throw ServerFailure(errorMessage: 'Erro ao fazer Login $e');
    }
  }

  @override
  Future<UserModel> authUser() async {
    try {
      final profileResponse = await supabase
          .from(SupabaseConsts.profiles)
          .select()
          .eq('id', supabase.auth.currentUser!.id)
          .single();

      return UserModel.fromJson(profileResponse);
    } catch (e) {
      throw ServerFailure(errorMessage: 'Erro ao buscar usuário autenticado.');
    }
  }

  @override
  Future<AuthResponseModel> signIn(LoginRequestDto loginDto) async {
    final response = await dio.post('/auth/login', data: loginDto.toJson());
    return AuthResponseModel.fromJson(response.data);
  }
}
