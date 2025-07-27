import 'package:dartz/dartz.dart';
import 'package:utueji/src/features/auth/domain/entities/auth_response_entity.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../params/login_request_params.dart';
import '../repositories/i_auth_repository.dart';

class SignInUseCase
    extends BaseUseCase<AuthResponseEntity, LoginRequestParams> {
  final IAuthRepository repository;
  SignInUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthResponseEntity>> call(
    LoginRequestParams params,
  ) async {
    return repository.signIn(params);
  }
}
