import 'package:agcnews/data/classes/top_stories_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
              Text("TOP STORIES", style: AgcTextStyle.header1),
              SizedBox(height: 5.0),
              AspectRatio(
                aspectRatio: 1920 / 1080,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/agcnewslogo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text("LATEST TODAY", style: AgcTextStyle.header2),
              SizedBox(height: 5.0),
              Text(
                "Putin promises grains, debt write-off as Russia seeks Africa allies",
                style: AgcTextStyle.header3,
                maxLines: 2,
              ),
              SizedBox(height: 30.0),
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.asset(
                            "assets/images/agcnewslogo.png",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NEWS TODAY", style: AgcTextStyle.header2),
                            SizedBox(height: 5.0),
                            Text(
                              "Putin promises grains, debt write-off as Russia seeks Africa allies",
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
        ),
      ),
    );
  }
}
