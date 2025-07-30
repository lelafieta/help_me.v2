import '../../domain/entities/favorite_entity.dart';

class FavoriteModel extends FavoriteEntity {
  FavoriteModel({
    required super.id,
    required super.itemId,
    required super.itemType,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      itemId: map['itemId'],
      userId: map['userId'],
      itemType: map['itemType'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  FavoriteModel copyWith({
    String? id,
    String? itemId,
    String? userId,
    String? itemType,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FavoriteModel(
      id: id ?? this.id,
      itemId: itemId ?? this.itemId,
      userId: userId ?? this.userId,
      itemType: itemType ?? this.itemType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
