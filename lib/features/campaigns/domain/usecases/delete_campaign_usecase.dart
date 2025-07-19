import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/i_campaign_repository.dart';

class DeleteCampaignUseCase extends UseCase<void, DeleteCampaignParams> {
  final ICampaignRepository repository;

  DeleteCampaignUseCase({required this.repository});

  @override
  Future<Either<Failure, Unit>> call(DeleteCampaignParams params) async {
    return await repository.deleteCampaign(params.id);
  }
}

class DeleteCampaignParams extends Equatable {
  final int id;

  const DeleteCampaignParams({required this.id});

  @override
  List<Object?> get props => [id];
}
