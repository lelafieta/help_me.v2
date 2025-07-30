import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/ong_entity.dart';
import '../models/ong_model.dart';
import 'i_ong_datasource.dart';

class OngDataSource extends IOngDataSource {
  final Dio dio;
  OngDataSource({required this.dio});

  @override
  Future<Unit> createOng(OngEntity ong) async {
    throw UnimplementedError();
  }

  @override
  Future<OngModel?> getOngById(String id) async {
    final response = await dio.get('/ongs/$id');
    if (response.data != null) {
      return OngModel.fromJson(response.data);
    }
    return null;
  }

  @override
  Future<List<OngModel>> getPopularesOngs() async {
    final response = await dio.get('/ongs/popular');
    return (response.data as List)
        .map((json) => OngModel.fromJson(json))
        .toList();
  }
}
