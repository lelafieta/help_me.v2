import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:help_me/core/error/exceptions.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/network/network_info.dart';
import 'package:help_me/features/campaigns/data/datasources/campaign_remote_data_source.dart';

import 'package:help_me/features/campaigns/data/dto/create_campaign_dto.dart';
import 'package:help_me/features/campaigns/data/dto/update_campaign_dto.dart';
import 'package:help_me/features/campaigns/domain/entities/campaign_entity.dart';
import 'package:help_me/features/campaigns/domain/repositories/campaign_repository.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  final CampaignRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CampaignRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, CampaignEntity>> createCampaign(
    CreateCampaignDto dto,
    List<MultipartFile> documents,
    List<MultipartFile> midias,
    MultipartFile cover,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaign = await remoteDataSource.createCampaign(
          dto,
          documents,
          midias,
          cover,
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
    int id,
    UpdateCampaignDto dto,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCampaign = await remoteDataSource.updateCampaign(id, dto);
        return Right(remoteCampaign);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCampaign(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteCampaign(id);
        return const Right(null);
      } on DioException catch (e) {
        return Left(ServerFailure(errorMessage: e.message));
      }
    } else {
      return const Left(NetworkFailure(errorMessage: 'No internet connection'));
    }
  }
}
