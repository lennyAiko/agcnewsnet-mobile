import 'package:agcnews/views/pages/search_page.dart';
import 'package:agcnews/views/widgets/drawer_widget.dart';
import 'package:agcnews/views/widgets/home/categories_widget.dart';
import 'package:agcnews/views/widgets/home/editors_pick_widget.dart';
import 'package:agcnews/views/widgets/home/footer_widget.dart';
import 'package:agcnews/views/widgets/home/latest_news_widget.dart';
import 'package:agcnews/views/widgets/home/missed_stories_widget.dart';
import 'package:agcnews/views/widgets/home/top_stories_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? refreshTrigger;

  @override
  void initState() {
    super.initState();
    refreshTrigger = DateTime.now();
  }

  Future<void> _refreshData() async {
    setState(() {
      refreshTrigger = DateTime.now();
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      drawer: SafeArea(child: DrawerWidget()),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopStoriesWidget(refreshTrigger: refreshTrigger),
                SizedBox(height: 25.0),
                LatestNewsWidget(refreshTrigger: refreshTrigger),
                SizedBox(height: 25.0),
                EditorsPickWidget(refreshTrigger: refreshTrigger),
                SizedBox(height: 25.0),
                CategoriesWidget(
                  title: "Politics",
                  id: 1,
                  refreshTrigger: refreshTrigger,
                ),
                SizedBox(height: 25.0),
                CategoriesWidget(
                  title: "Business",
                  id: 2,
                  refreshTrigger: refreshTrigger,
                ),
                SizedBox(height: 25.0),
                CategoriesWidget(
                  title: "Sports",
                  id: 3,
                  refreshTrigger: refreshTrigger,
                ),
                SizedBox(height: 25.0),
                CategoriesWidget(
                  title: "Entertainment",
                  id: 4,
                  refreshTrigger: refreshTrigger,
                ),
                SizedBox(height: 25.0),
                MissedStoriesWidget(refreshTrigger: refreshTrigger),
                SizedBox(height: 25.0),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
