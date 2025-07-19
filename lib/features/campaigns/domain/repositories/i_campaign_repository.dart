import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/campaign_entity.dart';
import '../params/create_campaign_params.dart';
import '../params/update_campaign_params.dart';

abstract class ICampaignRepository {
  Future<Either<Failure, CampaignEntity>> createCampaign(
    CreateCampaignParams params,
  );

  Future<Either<Failure, List<CampaignEntity>>> getAllCampaigns();

  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByUserId(
    int userId,
  );

  Future<Either<Failure, CampaignEntity>> getCampaignById(int id);

  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByCategoryId(
    int categoryId,
  );

  Future<Either<Failure, List<CampaignEntity>>> getMyCampaignsByStatus(
    int userId,
    String status,
  );

  Future<Either<Failure, List<CampaignEntity>>> getUrgentCampaignsSmart(
    int userId,
  );

  Future<Either<Failure, CampaignEntity>> updateCampaign(
    UpdateCampaignParams params,
  );

  Future<Either<Failure, Unit>> deleteCampaign(int id);

  ///
}
