import 'package:agcnews/data/classes/latest_article_activity.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<LatestArticleActivity>>? _searchResults;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
