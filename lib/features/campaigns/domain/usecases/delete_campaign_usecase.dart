
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/repositories/campaign_repository.dart';

class DeleteCampaignUseCase extends UseCase<void, DeleteCampaignParams> {
  final CampaignRepository repository;

  DeleteCampaignUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteCampaignParams params) async {
    return await repository.deleteCampaign(params.id);
  }
}

class DeleteCampaignParams extends Equatable {
  final int id;

  const DeleteCampaignParams({required this.id});

  @override
  List<Object?> get props => [id];
}
