import 'package:agcnews/data/classes/top_stories_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<TopStoriesActivity>>? topStories;

  @override
  void initState() {
    fetchTopStories();
    super.initState();
  }

  void fetchTopStories() {
    setState(() {
      topStories = API.fetchTopStories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40.0,
          child: Image.asset("assets/images/agcnewslogo.png"),
        ),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          SizedBox(width: 10.0),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Implement notifications functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Stories
              Column(
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
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final activities = snapshot.data!;
                        return Column(
                          children: [
                            for (final activity in activities)
                              Column(
                                children: [
                                  SizedBox(height: 10.0),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
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
                                                  activity
                                                      .story
                                                      .category
                                                      .categoryName
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
                                    ],
                                  ),
                                ],
                              ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              // Latest News
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("LATEST NEWS", style: AgcTextStyle.header1),
                  SizedBox(height: 5.0),
                  Stack(children: []),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
