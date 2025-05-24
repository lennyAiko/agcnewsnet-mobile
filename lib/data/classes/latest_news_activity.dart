class Category {
  final int categoryId;
  final String categoryName;
  final String? createdAt;
  final String? updatedAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class LatestNewsActivity {
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
  final dynamic editorsPick;
  final dynamic topStory;
  final Category category;
  final String bannerImage;
  final String createdAt;
  final String updatedAt;

  LatestNewsActivity({
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

  factory LatestNewsActivity.fromJson(Map<String, dynamic> json) {
    return LatestNewsActivity(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      author: json['author'],
      content: json['content'],
      featured: json['featured'].toString().toLowerCase() == 'true',
      views: json['views'],
      editorsPick: json['editors_pick'],
      topStory: json['top_story'],
      category: Category.fromJson(json['category']),
      bannerImage: json['banner_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
