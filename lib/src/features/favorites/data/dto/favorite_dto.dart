import '../../domain/params/favorite_params.dart';

class FavoriteDto extends FavoriteParams {
  FavoriteDto({required super.itemId, required super.itemType});

  Map<String, dynamic> toJson() {
    return {'itemId': itemId, 'itemType': itemType};
  }
}
