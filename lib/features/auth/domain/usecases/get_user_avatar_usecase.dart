import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/auth/domain/repositories/auth_repository.dart';

class GetUserAvatarUseCase implements UseCase<String?, NoParams> {
  final AuthRepository repository;

  GetUserAvatarUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await repository.getUserAvatar();
  }
}
