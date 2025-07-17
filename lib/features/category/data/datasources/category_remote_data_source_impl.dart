import 'package:dio/dio.dart';
import 'package:help_me/features/category/data/datasources/category_remote_data_source.dart';
import 'package:help_me/features/category/data/models/category_model.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CategoryModel>> getCategories() async {
    // Simulating API call for now
    // In a real application, you would make an actual HTTP request here:
    // final response = await dio.get('/categories');
    // if (response.statusCode == 200) {
    //   return (response.data as List)
    //       .map((json) => CategoryModel.fromJson(json))
    //       .toList();
    // } else {
    //   throw ServerException();
    // }

    // Static data for demonstration
    final List<Map<String, dynamic>> categoriesJson = [
      {
        "id": 1,
        "name": "Saúde",
        "description": "Dúvidas e informações sobre saúde e bem-estar.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
      {
        "id": 2,
        "name": "Educação",
        "description": "Perguntas e respostas sobre estudos e aprendizado.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
      {
        "id": 3,
        "name": "Tecnologia",
        "description": "Suporte e novidades sobre tecnologia e informática.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
      {
        "id": 4,
        "name": "Finanças",
        "description":
            "Conselhos e informações sobre finanças pessoais e investimentos.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
      {
        "id": 5,
        "name": "Culinária",
        "description": "Receitas e dicas de culinária.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
      {
        "id": 6,
        "name": "Animal",
        "description": "Cuidados, resgate e adoção de animais.",
        "createdAt": "2025-07-16T21:31:30.070Z",
      },
    ];

    return Future.value(
      categoriesJson.map((json) => CategoryModel.fromJson(json)).toList(),
    );
  }
}
