import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/i_network_info.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repositories/i_post_repository.dart';
import '../datasources/i_post_datasource.dart';

class PostRepository extends IPostRepository {
  final IPostDataSource postDataSource;
  final INetWorkInfo netWorkInfo;

  PostRepository({required this.postDataSource, required this.netWorkInfo});

  @override
  Future<Either<Failure, List<PostEntity>>> getPostsByCommunityId(
    String communityId,
  ) async {
    if (await netWorkInfo.isConnected) {
      try {
        final response = await postDataSource.getPostsByCommunityId(
          communityId,
        );
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
