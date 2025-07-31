import 'package:dio/dio.dart';
import 'package:utueji/src/features/communities/data/models/community_model.dart';

import 'i_community_datasource.dart';

class CommunityDataSource extends ICommunityDataSource {
  final Dio dio;

  CommunityDataSource({required this.dio});
  @override
  Future<List<CommunityModel>> getMyCommunities() async {
    final response = await dio.get('/communities/my');
    return (response.data as List)
        .map((json) => CommunityModel.fromJson(json))
        .toList();
  }
}
