class Category {
  final int categoryId;
  final String categoryName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  String getFormattedName() {
    return categoryName.toUpperCase();
  }
}

class Story {
  final int id;
  final String title;
  final String subtitle;
  final String description;
  final String status;
  final String type;
  final String author;
  final String content;
  final String featured;
  final int views;
  final bool? editorsPick;
  final bool? topStory;
  final Category category;
  final String bannerImage;
  final DateTime createdAt;
  final DateTime updatedAt;

  Story({
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
    required this.editorsPick,
    required this.topStory,
    required this.category,
    required this.bannerImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      status: json['status'],
      type: json['type'],
      author: json['author'],
      content: json['content'],
      featured: json['featured'],
      views: json['views'],
      editorsPick: json['editors_pick'],
      topStory: json['top_story'],
      category: Category.fromJson(json['category']),
      bannerImage: json['banner_image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  bool isFeatured() {
    return featured.toLowerCase() == 'true';
  }

  String getShortDescription() {
    return description.length > 100
        ? '${description.substring(0, 100)}...'
        : description;
  }
}

class TopStoriesActivity {
  final int id;
  final Story story;
  final DateTime createdAt;
  final DateTime updatedAt;

  TopStoriesActivity({
    required this.id,
    required this.story,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TopStoriesActivity.fromJson(Map<String, dynamic> json) {
    return TopStoriesActivity(
      id: json['id'],
      story: Story.fromJson(json['story']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  String getActivitySummary() {
    return '${story.title} in ${story.category.categoryName} by ${story.author}';
  }

  bool wasRecentlyCreated() {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    return difference.inHours < 24;
  }
}
