import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/auth/data/models/auth_dto.dart';
import 'package:help_me/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthResponseDto, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, AuthResponseDto>> call(LoginParams params) async {
    return await repository.login(params.loginRequest);
  }
}

class LoginParams extends Equatable {
  final LoginRequestDto loginRequest;

  const LoginParams({required this.loginRequest});

  @override
  List<Object> get props => [loginRequest];
}
