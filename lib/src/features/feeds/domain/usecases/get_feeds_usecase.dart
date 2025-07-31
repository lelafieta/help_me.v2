import 'package:dartz/dartz.dart';

import '../../../../core/entities/no_params.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/feed_entity.dart';
import '../repositories/i_feed_repository.dart';

class GetFeedsUseCase extends BaseUseCase<List<FeedEntity>, NoParams> {
  final IFeedRepository repository;

  GetFeedsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<FeedEntity>>> call(NoParams params) {
    return repository.fetchFeeds();
  }
}
