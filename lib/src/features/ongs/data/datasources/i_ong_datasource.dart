import 'package:dartz/dartz.dart';

import '../models/ong_model.dart';

abstract class IOngDataSource {
  Future<List<OngModel>> getPopularesOngs();
  Future<OngModel?> getOngById(String id);
  Future<Unit> createOng(OngModel ong);
}
