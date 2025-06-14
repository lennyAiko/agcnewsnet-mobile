import 'package:agcnews/data/classes/missed_stories_activities.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:flutter/material.dart';

class MissedStoriesWidget extends StatefulWidget {
  const MissedStoriesWidget({super.key, this.refreshTrigger});

  final DateTime? refreshTrigger;

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
  void didUpdateWidget(covariant MissedStoriesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refreshTrigger != oldWidget.refreshTrigger) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: missedStories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Column(
            children: [
              for (int i = 0; i <= 4; i++)
                Column(
                  children: [
                    Container(
                      height: 25.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final activities = snapshot.data!.sublist(0, 5);
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
              Column(
                children:
                    activities.map((activity) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(0),
                        dense: true,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            activity.bannerImage ?? "",
                          ),
                        ),
                        title: Text(
                          activity.title ?? "",
                          style: AgcTextStyle.header3,
                        ),
                        subtitle: Text(
                          activity.description ?? "",
                          style: AgcTextStyle.description,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => StoryPage(storyId: activity.id!),
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),
            ],
          );
        }
      },
    );
  }
}
