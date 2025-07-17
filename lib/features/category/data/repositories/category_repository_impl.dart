import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/exceptions.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/network/network_info.dart';
import 'package:help_me/features/category/data/datasources/category_remote_data_source.dart';
import 'package:help_me/features/category/domain/entities/category.dart';
import 'package:help_me/features/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteCategories = await remoteDataSource.getCategories();
        return Right(remoteCategories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
