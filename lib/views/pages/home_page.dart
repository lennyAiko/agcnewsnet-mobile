import 'package:agcnews/views/widgets/drawer_widget.dart';
import 'package:agcnews/views/widgets/home/categories_widget.dart';
import 'package:agcnews/views/widgets/home/editors_pick_widget.dart';
import 'package:agcnews/views/widgets/home/footer_widget.dart';
import 'package:agcnews/views/widgets/home/latest_news_widget.dart';
import 'package:agcnews/views/widgets/home/missed_stories_widget.dart';
import 'package:agcnews/views/widgets/home/top_stories_widget.dart';
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
      drawer: SafeArea(child: DrawerWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TopStoriesWidget(),
              SizedBox(height: 25.0),
              LatestNewsWidget(),
              SizedBox(height: 25.0),
              EditorsPickWidget(),
              SizedBox(height: 25.0),
              CategoriesWidget(title: "Politics", id: 1),
              SizedBox(height: 25.0),
              CategoriesWidget(title: "Business", id: 2),
              SizedBox(height: 25.0),
              CategoriesWidget(title: "Sports", id: 3),
              SizedBox(height: 25.0),
              CategoriesWidget(title: "Entertainment", id: 4),
              SizedBox(height: 25.0),
              MissedStoriesWidget(),
              SizedBox(height: 25.0),
              FooterWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
