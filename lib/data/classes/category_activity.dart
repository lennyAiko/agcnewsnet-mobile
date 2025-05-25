class CategoryActivity {
  final int? id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? status;
  final String? type;
  final String? author;
  final String? content;
  final bool? featured;
  final int? views;
  final bool? editorsPick;
  final bool? topStory;
  final Category? category;
  final String? bannerImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryActivity({
    this.id,
    this.title,
    this.subtitle,
    this.description,
    this.status,
    this.type,
    this.author,
    this.content,
    this.featured,
    this.views,
    this.editorsPick,
    this.topStory,
    this.category,
    this.bannerImage,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryActivity.fromJson(Map<String, dynamic> json) {
    return CategoryActivity(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      author: json['author'],
      content: json['content'],
      featured: json['featured']?.toString().toLowerCase() == 'true',
      views: json['views'],
      editorsPick: json['editors_pick'] == true,
      topStory: json['top_story'] == true,
      category:
          json['category'] != null ? Category.fromJson(json['category']) : null,
      bannerImage: json['banner_image'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }
}

class Category {
  final int? categoryId;
  final String? categoryName;
  final int? totalStories;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    this.categoryId,
    this.categoryName,
    this.totalStories,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      totalStories: json['total_stories'],
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
    );
  }
}
