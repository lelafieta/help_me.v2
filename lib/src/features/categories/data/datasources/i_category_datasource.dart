import '../models/category_model.dart';

abstract class ICategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
}
