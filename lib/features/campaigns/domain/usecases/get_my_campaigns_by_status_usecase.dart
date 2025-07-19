import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/usecases/usecase.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/i_campaign_repository.dart';

class GetMyCampaignsByStatusUseCase
    extends UseCase<List<CampaignEntity>, GetMyCampaignsByStatusParams> {
  final ICampaignRepository repository;

  GetMyCampaignsByStatusUseCase(this.repository);

  @override
  Future<Either<Failure, List<CampaignEntity>>> call(
    GetMyCampaignsByStatusParams params,
  ) async {
    return await repository.getMyCampaignsByStatus(
      params.userId,
      params.status,
    );
  }
}

class GetMyCampaignsByStatusParams extends Equatable {
  final int userId;
  final String status;

  const GetMyCampaignsByStatusParams({
    required this.userId,
    required this.status,
  });

  @override
  List<Object?> get props => [userId, status];
}
