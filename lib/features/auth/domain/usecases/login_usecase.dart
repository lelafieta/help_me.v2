import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/auth_response_entity.dart';
import '../params/login_request_params.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase implements UseCase<AuthResponseEntity, LoginRequestParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthResponseEntity>> call(
    LoginRequestParams params,
  ) async {
    return await repository.login(params);
  }
}
