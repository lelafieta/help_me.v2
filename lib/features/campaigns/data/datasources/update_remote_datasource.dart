import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/campaign_update_model.dart';
import 'i_update_remote_datasource.dart';

class UpdateRemoteDataSource extends IUpdateRemoteDataSource {
  final Dio dio;

  UpdateRemoteDataSource({required this.dio});

  @override
  Future<Unit> create(CampaignUpdateModel update) async {
    throw UnimplementedError();
  }

  @override
  Future<Unit> delete(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<CampaignUpdateModel>> listCampaignUpdates(String id) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> update(CampaignUpdateModel update) {
    throw UnimplementedError();
  }
}
