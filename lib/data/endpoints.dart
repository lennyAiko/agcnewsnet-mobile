import 'package:agcnews/data/classes/category_activity.dart';
import 'package:agcnews/data/classes/category_type_activity.dart';
import 'package:agcnews/data/classes/editors_pick_activity.dart';
import 'package:agcnews/data/classes/latest_article_activity.dart';
import 'package:agcnews/data/classes/latest_news_activity.dart';
import 'package:agcnews/data/classes/missed_stories_activities.dart';
import 'package:agcnews/data/classes/top_stories_activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static Future<List<TopStoriesActivity>> fetchTopStories() async {
    final url = Uri.parse("https://api.agcnewsnet.com/api/general/top-stories");
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData.map((item) => TopStoriesActivity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestNewsActivity>> fetchLatestNews({page = 1}) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories/latest-stories?page=$page&per_page=5",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData.map((item) => LatestNewsActivity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<EditorsPickActivity>> fetchEditorsPick() async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/editor-picks/?page=1&per_page=5",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => EditorsPickActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<CategoryActivity>> fetchCategory({categoryId = 1}) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/categories/$categoryId/stories?page=1&per_page=5",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData.map((item) => CategoryActivity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<MissedStoryActivity>> fetchMissedStories() async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories/missed-stories?page=1&per_page=5",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => MissedStoryActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<MissedStoryActivity> fetchStory({storyId}) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories/$storyId",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      return MissedStoryActivity.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<CategoryTypeActivity>> fetchCategories() async {
    final url = Uri.parse("https://api.agcnewsnet.com/api/general/categories");

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => CategoryTypeActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestArticleActivity>> fetchLatestArticles({
    page = 1,
  }) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories?page=$page&per_page=5&status=published&type=article",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => LatestArticleActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestArticleActivity>> fetchLatestAudios({
    page = 1,
  }) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories?page=$page&per_page=5&status=published&type=audio",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => LatestArticleActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestArticleActivity>> fetchLatestVideos({
    page = 1,
  }) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories?page=$page&per_page=5&status=published&type=video",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => LatestArticleActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestArticleActivity>> fetchLatestPictures({
    page = 1,
  }) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/stories?page=$page&per_page=5&status=published&type=picture",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => LatestArticleActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }

  static Future<List<LatestArticleActivity>> fetchCategoryStories({
    categoryId,
    page = 1,
  }) async {
    final url = Uri.parse(
      "https://api.agcnewsnet.com/api/general/categories/$categoryId/stories?page=$page&per_page=5",
    );

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Cache-Control': 'max-age=3600',
      },
    );

    print(jsonDecode(response.body)['message']);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['data']['data'];
      return jsonData
          .map((item) => LatestArticleActivity.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }
}
