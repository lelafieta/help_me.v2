import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/i_update_repository.dart';

class DeleteCampaignUpdateUseCase extends UseCase<Unit, String> {
  final IUpdateRepository repository;

  DeleteCampaignUpdateUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(String campaignUpdateId) async {
    return await repository.delete(campaignUpdateId);
  }
}
