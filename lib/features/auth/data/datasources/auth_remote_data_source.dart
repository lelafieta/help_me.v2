import 'package:dio/dio.dart';

import '../dto/login_dto.dart';
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login(LoginRequestDto loginRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthResponseModel> login(LoginRequestDto loginRequest) async {
    final response = await dio.post('/auth/login', data: loginRequest.toJson());
    return AuthResponseModel.fromJson(response.data);
  }
}
