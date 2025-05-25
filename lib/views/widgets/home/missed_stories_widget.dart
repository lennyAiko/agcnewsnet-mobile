import 'package:agcnews/data/classes/missed_stories_activities.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';

class MissedStoriesWidget extends StatefulWidget {
  const MissedStoriesWidget({super.key});

  @override
  State<MissedStoriesWidget> createState() => _MissedStoriesWidgetState();
}

class _MissedStoriesWidgetState extends State<MissedStoriesWidget> {
  Future<List<MissedStoryActivity>>? missedStories;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      missedStories = API.fetchMissedStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: missedStories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final activities = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "STORIES YOU MAY HAVE MISSED",
                    style: AgcTextStyle.header3,
                  ),
                ],
              ),
              SizedBox(height: 5.0),
            ],
          );
        }
      },
    );
  }
}
