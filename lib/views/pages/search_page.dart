import 'package:agcnews/data/classes/latest_article_activity.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<LatestArticleActivity>>? searchResults;
  Future<List<LatestArticleActivity>>? results;
  int currentPage = 1;
  List<LatestArticleActivity> stories = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      latestArticles = API.fetchCategoryStories(
        categoryId: widget.categoryId,
        page: currentPage,
      );
    });
    latestArticles!.then(
      (value) => setState(() {
        latestArticlesList.addAll(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
