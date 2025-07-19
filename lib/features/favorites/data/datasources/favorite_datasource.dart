import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/favorite_model.dart';
import 'i_favorite_datasource.dart';

class FavoriteDataSource extends IFavoriteDataSource {
  final Dio dio;

  FavoriteDataSource({required this.dio});
  @override
  Future<Unit> addFavorite(FavoriteModel favorite) async {
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteModel>> getAllFavotires() {
    throw UnimplementedError();
  }

  @override
  Future<List<FavoriteModel>> getFavoriteByType() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isMyFavorite(String id) async {
    throw UnimplementedError();
  }

  @override
  Future<Unit> removeFavorite(FavoriteModel favorite) async {
    throw UnimplementedError();
  }
}
