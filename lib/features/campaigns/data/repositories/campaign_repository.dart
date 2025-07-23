import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/campaign_entity.dart';
import '../../domain/params/create_campaign_params.dart';
import '../../domain/params/update_campaign_params.dart';

import '../../domain/repositories/i_campaign_repository.dart';
import '../datasources/i_campaign_remote_data_source.dart';
import '../dto/create_campaign_dto.dart';
import '../dto/update_campaign_dto.dart';

class CampaignRepository implements ICampaignRepository {
  final ICampaignRemoteDataSource remoteDataSource;
  final INetworkInfo networkInfo;

  CampaignRepository({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CampaignEntity>> createCampaign(
    CreateCampaignParams params,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaign = await remoteDataSource.createCampaign(
          CreateCampaignDto(),
        );
        return Right(remoteCampaign);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getAllCampaigns() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getAllCampaigns();
        return Right(remoteCampaigns);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByUserId(
    int userId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getCampaignsByUserId(
          userId,
        );
        return Right(remoteCampaigns);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, CampaignEntity>> getCampaignById(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaign = await remoteDataSource.getCampaignById(id);
        return Right(remoteCampaign);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getCampaignsByCategoryId(
    int categoryId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getCampaignsByCategoryId(
          categoryId,
        );
        return Right(remoteCampaigns);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getMyCampaignsByStatus(
    int userId,
    String status,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getMyCampaignsByStatus(
          userId,
          status,
        );
        return Right(remoteCampaigns);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, List<CampaignEntity>>> getUrgentCampaignsSmart(
    int userId,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaigns = await remoteDataSource.getUrgentCampaignsSmart(
          userId,
        );

        return Right(remoteCampaigns);
      } on DioException catch (e, s) {
        print(s);
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, CampaignEntity>> updateCampaign(
    UpdateCampaignParams updateParams,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaign = await remoteDataSource.updateCampaign(
          1,
          UpdateCampaignDto(),
        );
        return Right(remoteCampaign);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCampaign(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteCampaign(id);
        return const Right(unit);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }
}
