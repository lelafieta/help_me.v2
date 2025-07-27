import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/i_auth_repository.dart';

class ClearUserDataUseCase implements UseCase<void, NoParams> {
  final IAuthRepository repository;

  ClearUserDataUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.clearUserData();
  }
}
