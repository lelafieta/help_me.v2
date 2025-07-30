import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/features/ongs/domain/entities/ong_entity.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/respositories/i_ong_repository.dart';
import '../datasources/i_ong_datasource.dart';

class OngRepository extends IOngRepository {
  final IOngDataSource ongDataSource;
  final INetWorkInfo netWorkInfo;

  OngRepository({required this.ongDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, Unit>> createOng(OngEntity ong) {
    // TODO: implement createOng
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, OngEntity?>> getOngById(String id) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await ongDataSource.getOngById(id);
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
  Future<Either<Failure, List<OngEntity>>> getPopularesOngs() async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await ongDataSource.getPopularesOngs();
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
