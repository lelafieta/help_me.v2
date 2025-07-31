import 'package:dio/dio.dart';
import '../models/blog_model.dart';
import 'i_blog_datasource.dart';

class BlogDataSource extends IBlogDataSource {
  final Dio dio;

  BlogDataSource({required this.dio});

  @override
  Future<List<BlogModel>> getFeaturedBlogs() async {
    final response = await dio.get('/blogs/featured');
    return (response.data as List)
        .map((json) => BlogModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<BlogModel>> getForYouBlogs() async {
    final response = await dio.get('/blogs/for-you');
    return (response.data as List)
        .map((json) => BlogModel.fromJson(json))
        .toList();
  }
}
