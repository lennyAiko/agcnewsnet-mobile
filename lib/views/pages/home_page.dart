import 'package:agcnews/views/widgets/drawer_widget.dart';
import 'package:agcnews/views/widgets/latest_news_widget.dart';
import 'package:agcnews/views/widgets/top_stories_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Stories
              TopStoriesWidget(),
              SizedBox(height: 20.0),
              // Latest News
              LatestNewsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
