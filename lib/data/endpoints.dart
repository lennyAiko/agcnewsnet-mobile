import 'package:agcnews/data/classes/top_stories_activity.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  static Future<List<TopStoriesActivity>> fetchTopStories() async {
    final url = Uri.parse("https://api.agcnewsnet.com/api/general/top-stories");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => TopStoriesActivity.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load activity');
    }
  }
}
