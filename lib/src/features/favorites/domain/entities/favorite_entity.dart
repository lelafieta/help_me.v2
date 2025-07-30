class FavoriteEntity {
  String id;
  String itemId;
  String userId;
  String itemType;
  DateTime createdAt;
  DateTime updatedAt;

  FavoriteEntity({
    required this.id,
    required this.itemId,
    required this.userId,
    required this.itemType,
    required this.createdAt,
    required this.updatedAt,
  });
}
