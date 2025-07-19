import 'package:dartz/dartz.dart';
import 'package:help_me/core/error/exceptions.dart';
import 'package:help_me/core/error/failures.dart';
import 'package:help_me/core/network/network_info.dart';
import 'package:help_me/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:help_me/features/categories/domain/repositories/category_repository.dart';

import '../models/category_model.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CategoryRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
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
