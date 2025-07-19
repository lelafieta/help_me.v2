class FavoriteEntity {
  String? id;
  int? itemId;
  int? userId;
  String? itemType;
  DateTime? createdAt;
  DateTime? updatedAt;

  FavoriteEntity({
    this.id,
    this.itemId,
    this.userId,
    this.itemType,
    this.createdAt,
    this.updatedAt,
  });
}
