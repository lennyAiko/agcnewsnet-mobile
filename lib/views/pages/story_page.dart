import 'package:agcnews/data/classes/missed_stories_activities.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.storyId});
  final int storyId;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Future<MissedStoryActivity>? story;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      story = API.fetchStory(storyId: widget.storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
