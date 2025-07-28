import 'package:dio/dio.dart';

import '../models/category_model.dart';
import 'i_category_datasource.dart';

class CategoryDataSource extends ICategoryDataSource {
  final Dio dio;

  CategoryDataSource({required this.dio});

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final response = await dio.get('/categories');
    return (response.data as List)
        .map((json) => CategoryModel.fromJson(json))
        .toList();
  }
}
