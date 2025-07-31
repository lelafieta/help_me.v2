import '../models/blog_model.dart';

abstract class IBlogDataSource {
  Future<List<BlogModel>> getFeaturedBlogs();
  Future<List<BlogModel>> getForYouBlogs();
}
