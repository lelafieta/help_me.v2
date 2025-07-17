import 'package:dio/dio.dart';
import 'package:help_me/features/categories/data/datasources/category_remote_data_source.dart';
import 'package:help_me/features/categories/data/models/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    // Simulating API call for now
    // In a real application, you would make an actual HTTP request here:
    final response = await dio.get('/categories');
    return (response.data as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }
}
