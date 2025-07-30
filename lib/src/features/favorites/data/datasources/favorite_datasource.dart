import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:utueji/src/features/favorites/data/dto/favorite_dto.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/supabase/supabase_consts.dart';
import '../models/favorite_model.dart';

import 'i_favorite_datasource.dart';

class FavoriteDataSource extends IFavoriteDataSource {
  final Dio dio;

  FavoriteDataSource({required this.dio});

  @override
  Future<FavoriteModel> addFavorite(FavoriteDto favorite) async {
    final response = await dio.post('/favorites', data: favorite.toJson());
    final json = response.data as dynamic;
    return FavoriteModel.fromJson(json);
  }

  @override
  Future<List<FavoriteModel>> getAllFavotires() async {
    final response = await dio.get('/favorites');
    return (response.data as List)
        .map((json) => FavoriteModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<FavoriteModel>> getFavoritesByType(String itemType) async {
    final response = await dio.get('/favorites?itemType=$itemType');
    return (response.data as List)
        .map((json) => FavoriteModel.fromJson(json))
        .toList();
  }

  @override
  Future<bool> isMyFavorite(String id) async {
    final response = await dio.get('/favorites/$id');
    final json = response.data as dynamic;
    if (json['favorited'] == true) {
      return true;
    }
    return false;
  }

  @override
  Future<void> removeFavorite(FavoriteDto favorite) async {
    await dio.delete('/favorites', data: favorite.toJson());
  }
}
