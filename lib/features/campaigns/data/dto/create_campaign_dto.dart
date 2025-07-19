import 'package:equatable/equatable.dart';

class CreateCampaignDto extends Equatable {
  final String title;
  final String description;
  final String status;
  final int userId;
  final int categoryId;

  const CreateCampaignDto({
    required this.title,
    required this.description,
    required this.status,
    required this.userId,
    required this.categoryId,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'userId': userId,
      'categoryId': categoryId,
    };
  }

  @override
  List<Object?> get props => [title, description, status, userId, categoryId];
}
