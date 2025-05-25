class EditorsPickActivity {
  final int? id;
  final Story? story;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  EditorsPickActivity({this.id, this.story, this.createdAt, this.updatedAt});

  factory EditorsPickActivity.fromJson(Map<String, dynamic> json) {
    return EditorsPickActivity(
      id: json['id'],
      story: json['story'] != null ? Story.fromJson(json['story']) : null,
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

class Story {
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
  final User? user;
  final Category? category;
  final String? bannerImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Story({
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
    this.user,
    this.category,
    this.bannerImage,
    this.createdAt,
    this.updatedAt,
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
      featured: json['featured']?.toString().toLowerCase() == "true",
      views: json['views'],
      editorsPick: json['editors_pick'],
      topStory: json['top_story'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
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

class User {
  final int? id;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? firstName;
  final String? lastName;
  final int? failedLoginAttempts;
  final DateTime? lockedDueToFailedLoginAttemptsAt;
  final int? roleId;

  User({
    this.id,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.failedLoginAttempts,
    this.lockedDueToFailedLoginAttemptsAt,
    this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      emailVerifiedAt:
          json['email_verified_at'] != null
              ? DateTime.tryParse(json['email_verified_at'])
              : null,
      createdAt:
          json['created_at'] != null
              ? DateTime.tryParse(json['created_at'])
              : null,
      updatedAt:
          json['updated_at'] != null
              ? DateTime.tryParse(json['updated_at'])
              : null,
      firstName: json['first_name'],
      lastName: json['last_name'],
      failedLoginAttempts: json['failed_login_attempts'],
      lockedDueToFailedLoginAttemptsAt:
          json['locked_due_to_failed_login_attempts_at'] != null
              ? DateTime.tryParse(
                json['locked_due_to_failed_login_attempts_at'],
              )
              : null,
      roleId: json['role_id'],
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
