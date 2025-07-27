import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/i_auth_repository.dart';

class GetUserAvatarUseCase implements UseCase<String?, NoParams> {
  final IAuthRepository repository;

  GetUserAvatarUseCase({required this.repository});

  @override
  Future<Either<Failure, String?>> call(NoParams params) async {
    return await repository.getUserAvatar();
  }
}
