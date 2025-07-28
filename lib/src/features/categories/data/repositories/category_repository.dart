import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:utueji/src/core/errors/error_messages.dart';

import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/core/utils/app_strings.dart';

import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/repositories/i_category_repository.dart';
import '../datasources/i_category_datasource.dart';

class CategoryRepository extends ICategoryRepository {
  final INetWorkInfo netWorkInfo;
  final ICategoryDataSource categoryDataSource;

  CategoryRepository({
    required this.netWorkInfo,
    required this.categoryDataSource,
  });

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await categoryDataSource.getAllCategories();

        return Right(response);
      } on DioException catch (e) {
        return Left(ServerFailure.fromDioException(e));
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return const Left(
        ServerFailure(errorMessage: ErrorMessages.notInternetConnection),
      );
    }
  }
}
