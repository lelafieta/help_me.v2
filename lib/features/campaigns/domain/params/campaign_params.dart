class CampaignParams {
  final int page;
  final int limit;
  final String? status;
  final String? title;
  final String? filter;
  final int? categoryId;

  CampaignParams({
    required this.page,
    required this.limit,
    this.status,
    this.title,
    this.filter,
    this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'limit': limit,
      if (status != null) 'status': status,
      if (title != null) 'title': title,
      if (filter != null) 'filter': filter,
      if (categoryId != null) 'categoryId': categoryId,
    };
  }
}
