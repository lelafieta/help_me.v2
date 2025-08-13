import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/features/campaigns/data/models/campaign_model.dart';

import '../../../../core/network/i_network_info.dart';
import '../../../../core/services/analytics_service.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/entities/campaign_params.dart';
import '../../domain/repositories/i_campaign_repository.dart';
import '../datasources/i_campaign_datasource.dart';

class CampaignRepository implements ICampaignRepository {
  final ICampaignRemoteDataSource campaignDataSource;
  final INetWorkInfo networkInfo;
  final IFirebaseAnalyticsService firebaseAnalyticsService;

  CampaignRepository({
    required this.campaignDataSource,
    required this.networkInfo,
    required this.firebaseAnalyticsService,
  });

  @override
  Future<Either<Failure, Unit>> createCampaign(CampaignEntity campaign) async {
    if (await networkInfo.isConnected == true) {
      try {
        await campaignDataSource.createCampaign(CampaignModel());
        return right(unit);
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCampaign(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getAllCampaigns(
    CampaignParams params,
  ) async {
    if (await networkInfo.isConnected == true) {
      try {
        final response = await campaignDataSource.getAllCampaigns(params);
        return right(response);
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getAllUrgentCampaigns(
    CampaignParams params,
  ) async {
    if (await networkInfo.isConnected == true) {
      try {
        final response = await campaignDataSource.getAllUrgentCampaigns(params);

        // 🔹 Log de sucesso no Analytics
        await firebaseAnalyticsService.logEvent(
          name: "get_all_urgent_campaigns_success",
          parameters: {
            "count": response.length,
            "country": params.location ?? "unknown",
          },
        );

        print("REGISTADO COM SUCESSO NO ANALYTICS");

        return right(response);
      } catch (e, s) {
        // 🔹 Log de erro no Analytics
        await firebaseAnalyticsService.logEvent(
          name: "get_all_urgent_campaigns_error",
          parameters: {"error": e.toString()},
        );

        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      // 🔹 Log de erro offline
      await firebaseAnalyticsService.logEvent(
        name: "get_all_urgent_campaigns_no_connection",
      );

      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, CampaignEntity>> getCampaignById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await campaignDataSource.getCampaignById(id);
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getLatestUrgentCampaigns(
    CampaignParams params,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await campaignDataSource.getLatestUrgentCampaigns();
        // 🔹 Log de sucesso no Analytics
        await firebaseAnalyticsService.logEvent(
          name: "get_all_urgent_campaigns_success",
          parameters: {
            "count": response.length,
            "country": params.location ?? "unknown",
          },
        );

        print("REGISTADO COM SUCESSO NO ANALYTICS----");
        return right(response);
      } on DioException catch (e) {
        await firebaseAnalyticsService.logEvent(
          name: "get_all_urgent_campaigns_error",
          parameters: {"error": e.toString()},
        );
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        await firebaseAnalyticsService.logEvent(
          name: "get_all_urgent_campaigns_error",
          parameters: {"error": e.toString()},
        );
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCampaign(CampaignEntity campaign) {
    // TODO: implement updateCampaign
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getAllMyCampaigns({
    String? status,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await campaignDataSource.getAllMyCampaigns(
          status: status,
        );
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e) {
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }
}
