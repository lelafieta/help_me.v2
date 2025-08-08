import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/i_event_repository.dart';
import '../datasources/i_event_datasource.dart';

class EventRepository extends IEventRepository {
  final IEventDataSource eventDataSource;
  final INetWorkInfo netWorkInfo;

  EventRepository({required this.eventDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, List<EventEntity>>> getNearbyEvents() async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await eventDataSource.fetchNearbyEvents();
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
  Future<Either<Failure, EventEntity?>> getEventById(String id) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await eventDataSource.getEventById(id);

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
  Future<Either<Failure, List<EventEntity>>> getEventsByCommunityId(
    String communityId,
  ) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await eventDataSource.getEventsByCommunityId(
          communityId,
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
