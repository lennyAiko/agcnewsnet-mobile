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
      searchResults = API.searchStory(
        page: currentPage,
        search:
            searchController.value.text.isEmpty
                ? ' '
                : searchController.value.text,
      );
    });
    searchResults!.then(
      (value) => setState(() {
        stories.addAll(value);
      }),
    );
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
            GestureDetector(
              onTap: () {
                // Get the current focus node
                FocusScopeNode currentFocus = FocusScope.of(context);

                // If the current focus is not the primary focus (i.e., the TextField
                // has focus) and there's a focused child (the TextField),
                // then unfocus it.
                if (!currentFocus.hasPrimaryFocus &&
                    currentFocus.focusedChild != null) {
                  currentFocus.unfocus();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    hintText: 'Search',
                  ),
                  onSubmitted: (value) {
                    currentPage = 1;
                    stories.clear();
                    fetchData();
                  },
                ),
              ),
            ),
            FutureBuilder(
              future: searchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
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
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (stories.isEmpty) {
                    searchWidget = Center(
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
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
                                        search:
                                            searchController.value.text.isEmpty
                                                ? 'agcnews'
                                                : searchController.value.text,
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
