import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/core/network/i_network_info.dart';

import 'package:utueji/src/features/communities/domain/entities/community_entity.dart';
import 'package:utueji/src/features/communities/domain/entities/community_member_entity.dart';

import '../../domain/repositories/i_community_repository.dart';
import '../datasources/i_community_datasource.dart';

class CommunityRepository extends ICommunityRepository {
  final ICommunityDataSource communityDataSource;
  final INetWorkInfo netWorkInfo;

  CommunityRepository({
    required this.communityDataSource,
    required this.netWorkInfo,
  });

  @override
  Future<Either<Failure, List<CommunityEntity>>> getMyCommunities() async {
    if (await netWorkInfo.isConnected == true) {
      try {
        final response = await communityDataSource.getMyCommunities();
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e, s) {
        print(s);
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<CommunityMemberEntity>>> getMembersByCommunity(
    String communityId,
  ) async {
    if (await netWorkInfo.isConnected == true) {
      try {
        final response = await communityDataSource.getMembersByCommunity(
          communityId,
        );
        return right(response);
      } on DioException catch (e) {
        return left(ServerFailure.fromDioException(e));
      } catch (e, s) {
        print(s);
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }
}
