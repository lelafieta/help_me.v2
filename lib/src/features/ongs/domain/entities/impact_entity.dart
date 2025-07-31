import '../../../auth/domain/entities/user_entity.dart';
import 'impact_midia_entity.dart';

class ImpactEntity {
  final String id;
  final String title;
  final String content;
  final String userId;
  final String ongId;
  final DateTime createdAt;
  final UserEntity user;
  final List<ImpactMediaEntity> medias;
  DateTime? date;

  ImpactEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.userId,
    required this.ongId,
    required this.createdAt,
    required this.user,
    required this.medias,
    this.date,
  });
}
