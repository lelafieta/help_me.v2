import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/ong_entity.dart';
import '../respositories/i_ong_repository.dart';

class GetOngByIdUsecase extends BaseUseCase<OngEntity?, String> {
  final IOngRepository repository;

  GetOngByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, OngEntity?>> call(String params) {
    return repository.getOngById(params);
  }
}
