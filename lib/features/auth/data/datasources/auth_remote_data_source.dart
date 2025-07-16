import 'package:dio/dio.dart';
import 'package:help_me/core/error/exceptions.dart';
import 'package:help_me/features/auth/data/models/auth_dto.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseDto> login(LoginRequestDto loginRequest);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<AuthResponseDto> login(LoginRequestDto loginRequest) async {
    try {
      final response = await dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
      );
      return AuthResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }
}
