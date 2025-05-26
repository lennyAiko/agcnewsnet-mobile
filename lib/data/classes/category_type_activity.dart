class CategoryTypeActivity {
  final int categoryId;
  final String categoryName;
  final int totalStories;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryTypeActivity({
    required this.categoryId,
    required this.categoryName,
    required this.totalStories,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryTypeActivity.fromJson(Map<String, dynamic> json) {
    return CategoryTypeActivity(
      categoryId: json['category_id'],
      categoryName: json['category_name'],
      totalStories: json['total_stories'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': categoryId,
      'category_name': categoryName,
      'total_stories': totalStories,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
