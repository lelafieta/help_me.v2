import '../dto/favorite_dto.dart';
import '../models/favorite_model.dart';

abstract class IFavoriteDataSource {
  Future<FavoriteModel> addFavorite(FavoriteDto favorite);
  Future<void> removeFavorite(FavoriteDto favorite);
  Future<bool> isMyFavorite(String id);
  Future<List<FavoriteModel>> getAllFavotires();
  Future<List<FavoriteModel>> getFavoritesByType(String itemType);
}
