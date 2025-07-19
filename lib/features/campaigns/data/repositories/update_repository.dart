import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/campaign_update_entity.dart';
import '../../domain/repositories/i_update_repository.dart';
import '../datasources/i_update_remote_datasource.dart';
import '../models/campaign_update_model.dart';

class UpdateRepository extends IUpdateRepository {
  final IUpdateRemoteDataSource datasource;
  final INetworkInfo netWorkInfo;

  UpdateRepository({required this.datasource, required this.netWorkInfo});
  @override
  Future<Either<Failure, Unit>> create(CampaignUpdateEntity update) async {
    try {
      final response = await datasource.create(
        CampaignUpdateModel.fromEntity(update),
      );

      return right(response);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<CampaignUpdateEntity>>> listCampaignUpdates(
    String id,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> update(CampaignUpdateEntity update) {
    throw UnimplementedError();
  }
}
