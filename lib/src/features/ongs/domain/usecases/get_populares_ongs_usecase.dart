import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/ong_entity.dart';
import '../respositories/i_ong_repository.dart';

class GetPopularesOngsUsecase extends BaseUseCase<List<OngEntity>, NoParams> {
  final IOngRepository repository;

  GetPopularesOngsUsecase({required this.repository});

  @override
  Future<Either<Failure, List<OngEntity>>> call(NoParams params) {
    return repository.getPopularesOngs();
  }
}
