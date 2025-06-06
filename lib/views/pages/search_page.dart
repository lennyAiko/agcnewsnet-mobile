import 'package:agcnews/data/classes/latest_article_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:agcnews/views/widgets/home/footer_widget.dart';
import 'package:flutter/material.dart';

Widget searchWidget = Container();

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<LatestArticleActivity>>? searchResults;
  Future<List<LatestArticleActivity>>? results;
  int currentPage = 1;
  List<LatestArticleActivity> stories = [];
  TextEditingController searchController = TextEditingController();

  // @override
  // void initState() {
  //   // fetchData();
  //   super.initState();
  // }

  void fetchData() {
    setState(() {
      searchResults = API.searchStory(page: currentPage);
    });
    searchResults!.then(
      (value) => setState(() {
        stories.addAll(value);
      }),
    );
    print(stories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                ),
                onSubmitted: (value) {
                  fetchData();
                },
              ),
            ),
            FutureBuilder(
              future: searchResults,
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
                  if (stories.isEmpty) {
                    searchWidget = Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "No results found",
                          style: AgcTextStyle.header2,
                        ),
                      ),
                    );
                  } else {
                    final otherActivities = stories.sublist(1);
                    searchWidget = Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5.0),
                        Text("Search Results", style: AgcTextStyle.header1),
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
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
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
                          future: results,
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
                                      results = API.searchStory(
                                        page: currentPage + 1,
                                      );
                                    });
                                    currentPage++;
                                    results!.then(
                                      (value) => setState(() {
                                        stories.addAll(value);
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
                    );
                  }
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: searchWidget,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
