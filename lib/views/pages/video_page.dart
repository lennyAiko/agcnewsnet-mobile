import 'package:agcnews/data/classes/latest_article_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:agcnews/views/widgets/home/footer_widget.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => VideoPageState();
}

class VideoPageState extends State<VideoPage> {
  Future<List<LatestArticleActivity>>? latestArticles;
  Future<List<LatestArticleActivity>>? articles;
  int currentPage = 1;
  List<LatestArticleActivity> latestArticlesList = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      latestArticles = API.fetchLatestVideos();
    });
    latestArticles!.then(
      (value) => setState(() {
        latestArticlesList.addAll(value);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: latestArticles,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    for (int i = 0; i <= 3; i++)
                      Column(
                        children: [
                          Container(
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          SizedBox(height: 15.0),
                          Container(
                            height: 30.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            if (latestArticlesList.isEmpty) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("No Videos", style: AgcTextStyle.header2),
                ),
              );
            } else {
              final firstActivity = snapshot.data!.first;
              final otherActivities = latestArticlesList.sublist(1);
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5.0),
                      Text("Latest in Article", style: AgcTextStyle.header1),
                      SizedBox(height: 5.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                hoverColor: Colors.transparent,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => StoryPage(
                                            storyId: firstActivity.id,
                                          ),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.topLeft,
                                      children: [
                                        Hero(
                                          tag: "latestArticle",
                                          child: AspectRatio(
                                            aspectRatio: 1920 / 1080,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                firstActivity.bannerImage,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                color: Colors.pink,
                                              ),
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                firstActivity
                                                    .category
                                                    .categoryName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      firstActivity.title,
                                      style: AgcTextStyle.header3,
                                      maxLines: 2,
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      children: [
                                        Text(
                                          "Posted on ${DateTime.parse(firstActivity.createdAt.toString()).day}${AgcDate.getDaySuffix(DateTime.parse(firstActivity.createdAt.toString()).day)} ${AgcDate.months[DateTime.parse(firstActivity.createdAt.toString()).month]} ${DateTime.parse(firstActivity.createdAt.toString()).year}",
                                          style: TextStyle(
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "${AgcDate.calculateReadTime(firstActivity.content)} min(s) read",
                                          style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.1,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      firstActivity.description,
                                      style: AgcTextStyle.description,
                                      maxLines: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.pink),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) =>
                                      StoryPage(storyId: firstActivity.id),
                            ),
                          );
                        },
                        child: Text(
                          "Read more",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 40.0),
                      for (final activity in otherActivities)
                        Column(
                          children: [
                            InkWell(
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
                                children: [
                                  AspectRatio(
                                    aspectRatio: 2140 / 1080,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        activity.bannerImage,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    activity.title,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 25.0),
                          ],
                        ),
                      FutureBuilder(
                        future: articles,
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
                            return Center(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                    Colors.pink,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    articles = API.fetchLatestVideos(
                                      page: currentPage + 1,
                                    );
                                  });
                                  currentPage++;
                                  articles!.then(
                                    (value) => setState(() {
                                      latestArticlesList.addAll(value);
                                    }),
                                  );
                                },
                                child: Text(
                                  "Load more",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(height: 25.0),
                      FooterWidget(),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
