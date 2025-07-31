import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:utueji/src/core/errors/failures.dart';
import 'package:utueji/src/core/network/i_network_info.dart';
import 'package:utueji/src/features/blogs/domain/entities/blog_entity.dart';

import '../../domain/repositories/i_blog_repository.dart';
import '../datasources/i_blog_datasource.dart';

class BlogRepository extends IBlogRepository {
  final IBlogDataSource blogDataSource;
  final INetWorkInfo netWorkInfo;

  BlogRepository({required this.blogDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, List<BlogEntity>>> getFeaturedBlogs() async {
    if (await netWorkInfo.isConnected == true) {
      try {
        final response = await blogDataSource.getFeaturedBlogs();
        return right(response);
      } on DioException catch (e, s) {
        print(e);
        print(s);
        return left(ServerFailure.fromDioException(e));
      } catch (e, s) {
        print(e);
        print(s);
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }

  @override
  Future<Either<Failure, List<BlogEntity>>> getForYouBlogs() async {
    if (await netWorkInfo.isConnected == true) {
      try {
        final response = await blogDataSource.getForYouBlogs();
        return right(response);
      } on DioException catch (e, s) {
        print(e);
        print(s);
        return left(ServerFailure.fromDioException(e));
      } catch (e, s) {
        print(e);
        print(s);
        return left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return left(ServerFailure(errorMessage: "Sem conexão de internet"));
    }
  }
}
