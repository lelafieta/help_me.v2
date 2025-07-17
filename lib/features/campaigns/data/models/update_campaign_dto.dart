import 'package:equatable/equatable.dart';

class UpdateCampaignDto extends Equatable {
  final String? title;
  final String? description;
  final String? status;
  final String? imageCoverUrl;
  final List<String>? mediaUrls;
  final List<String>? documentUrls;

  const UpdateCampaignDto({
    this.title,
    this.description,
    this.status,
    this.imageCoverUrl,
    this.mediaUrls,
    this.documentUrls,
  });

  Map<String, dynamic> toJson() {
    return {
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (status != null) 'status': status,
      if (imageCoverUrl != null) 'imageCoverUrl': imageCoverUrl,
      if (mediaUrls != null) 'mediaUrls': mediaUrls,
      if (documentUrls != null) 'documentUrls': documentUrls,
    };
  }

  @override
  List<Object?> get props => [
    title,
    description,
    status,
    imageCoverUrl,
    mediaUrls,
    documentUrls,
  ];
}
