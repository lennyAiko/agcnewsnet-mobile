import 'package:agcnews/data/classes/latest_news_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:flutter/material.dart';

class LatestNewsWidget extends StatefulWidget {
  const LatestNewsWidget({super.key, this.refreshTrigger});

  final DateTime? refreshTrigger;

  @override
  State<LatestNewsWidget> createState() => _LatestNewsWidgetState();
}

class _LatestNewsWidgetState extends State<LatestNewsWidget> {
  Future<List<LatestNewsActivity>>? latestNews;
  Future<List<LatestNewsActivity>>? news;
  int currentPage = 1;
  List<LatestNewsActivity> latestNewsList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      latestNews = API.fetchLatestNews();
    });
    latestNews!.then(
      (value) => setState(() {
        latestNewsList.addAll(value);
      }),
    );
  }

  @override
  void didUpdateWidget(covariant LatestNewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refreshTrigger != oldWidget.refreshTrigger) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("LATEST NEWS", style: AgcTextStyle.header1),
        SizedBox(height: 5.0),
        FutureBuilder<List<LatestNewsActivity>>(
          future: latestNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 1; i <= 5; i++)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              height: 150.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Container(
                              height: 20.0,
                              width: 150.0,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final activity in latestNewsList)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        StoryPage(storyId: activity.id),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.network(
                                  activity.bannerImage,
                                  height: 200.0,
                                  width: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                activity.category.categoryName.toUpperCase(),
                                style: AgcTextStyle.header2,
                              ),
                              SizedBox(height: 5.0),
                              SizedBox(
                                width: 200.0,
                                child: Text(
                                  activity.title,
                                  style: AgcTextStyle.header3,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    FutureBuilder(
                      future: news,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return IconButton(
                            onPressed: () {
                              setState(() {
                                news = API.fetchLatestNews(
                                  page: currentPage + 1,
                                );
                              });
                              currentPage++;
                              news!.then(
                                (value) => setState(() {
                                  latestNewsList.addAll(value);
                                }),
                              );
                            },
                            icon: Icon(Icons.arrow_forward),
                            iconSize: 35.0,
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
