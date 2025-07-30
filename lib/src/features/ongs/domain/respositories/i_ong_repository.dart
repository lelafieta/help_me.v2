import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/ong_entity.dart';

abstract class IOngRepository {
  Future<Either<Failure, OngEntity?>> getOngById(String id);
  Future<Either<Failure, List<OngEntity>>> getPopularesOngs();
  Future<Either<Failure, Unit>> createOng(OngEntity ong);
}
