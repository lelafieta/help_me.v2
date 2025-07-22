import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/auth/domain/repositories/auth_repository.dart';

class ClearUserDataUseCase implements UseCase<void, NoParams> {
  final AuthRepository repository;

  ClearUserDataUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.clearUserData();
  }
}
