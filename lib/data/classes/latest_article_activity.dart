class LatestArticleActivity {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String status;
  final String type;
  final String author;
  final String content;
  final bool featured;
  final int views;
  final bool? editorsPick;
  final bool? topStory;
  final Category category;
  final String bannerImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  LatestArticleActivity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.status,
    required this.type,
    required this.author,
    required this.content,
    required this.featured,
    required this.views,
    this.editorsPick,
    this.topStory,
    required this.category,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LatestArticleActivity.fromJson(Map<String, dynamic> json) {
    return LatestArticleActivity(
      id: json['id'],
      title: json['title'] ?? '',
      subtitle: json['subtitle'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      featured: json['featured'] == 'true',
      views: json['views'] ?? 0,
      editorsPick:
          json['editors_pick'] == null ? null : json['editors_pick'] == true,
      topStory: json['top_story'] == null ? null : json['top_story'] == true,
      category: Category.fromJson(json['category']),
      bannerImage: json['banner_image'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Category {
  final int categoryId;
  final String categoryName;
  final int? totalStories;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    this.totalStories,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'] ?? '',
      totalStories: json['total_stories'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
