import 'package:agcnews/data/classes/top_stories_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:flutter/material.dart';

class TopStoriesWidget extends StatefulWidget {
  const TopStoriesWidget({super.key, this.refreshTrigger});

  final DateTime? refreshTrigger;

  @override
  State<TopStoriesWidget> createState() => _TopStoriesWidgetState();
}

class _TopStoriesWidgetState extends State<TopStoriesWidget> {
  Future<List<TopStoriesActivity>>? topStories;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TopStoriesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refreshTrigger != oldWidget.refreshTrigger) {
      fetchData();
    }
  }

  void fetchData() {
    setState(() {
      topStories = API.fetchTopStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("TOP STORIES", style: AgcTextStyle.header1),
        SizedBox(height: 5.0),
        FutureBuilder<List<TopStoriesActivity>>(
          future: topStories,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= 3; i++)
                        InkWell(
                          onTap: () {},
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Container(
                                          height: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                              15.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 30.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                            SizedBox(height: 5.0),
                                            Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final activities = snapshot.data!;
              return Column(
                children: [
                  for (final activity in activities)
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    StoryPage(storyId: activity.story.id),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10.0),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Image.network(
                                        activity.story.bannerImage,
                                        height: 100.0,
                                        width: 150.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          activity.story.category.categoryName
                                              .toUpperCase(),
                                          style: AgcTextStyle.header2,
                                        ),
                                        SizedBox(height: 5.0),
                                        Text(
                                          activity.story.title,
                                          style: AgcTextStyle.header3,
                                          maxLines: 3,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
