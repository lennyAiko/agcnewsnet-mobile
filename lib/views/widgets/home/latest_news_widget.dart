import 'package:agcnews/data/classes/latest_news_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:flutter/material.dart';

class LatestNewsWidget extends StatefulWidget {
  const LatestNewsWidget({super.key});

  @override
  State<LatestNewsWidget> createState() => _LatestNewsWidgetState();
}

class _LatestNewsWidgetState extends State<LatestNewsWidget> {
  Future<List<LatestNewsActivity>>? latestNews;
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
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(),
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          latestNews = API.fetchLatestNews(
                            page: currentPage + 1,
                          );
                        });
                        currentPage++;
                        latestNews!.then(
                          (value) => setState(() {
                            latestNewsList.addAll(value);
                          }),
                        );
                      },
                      icon: Icon(Icons.arrow_forward),
                      iconSize: 35.0,
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
