import 'package:agcnews/data/classes/category_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/story_page.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({
    super.key,
    required this.title,
    required this.id,
    this.refreshTrigger,
  });

  final DateTime? refreshTrigger;

  final String title;
  final int id;

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  Future<List<CategoryActivity>>? category;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      category = API.fetchCategory(categoryId: widget.id);
    });
  }

  @override
  void didUpdateWidget(covariant CategoriesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refreshTrigger != oldWidget.refreshTrigger) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: category,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 30.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 20.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Column(
                  children: [
                    for (int i = 0; i <= 4; i++)
                      Column(
                        children: [
                          Container(
                            height: 25.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          SizedBox(height: 15.0),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final firstActivity = snapshot.data!.first;
          final otherActivities = snapshot.data!.sublist(1);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(widget.title, style: AgcTextStyle.header1),
                  SizedBox(width: 10.0),
                  Icon(Icons.keyboard_arrow_right, size: 25.0),
                ],
              ),
              SizedBox(height: 10.0),
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
                              (context) =>
                                  StoryPage(storyId: firstActivity.id!),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1920 / 1080,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              firstActivity.bannerImage ?? "",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          firstActivity.title ?? "",
                          style: AgcTextStyle.header3,
                          maxLines: 2,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          firstActivity.description ?? "",
                          style: AgcTextStyle.description,
                          maxLines: 3,
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 18.0,
                                  color: Colors.red[600],
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  firstActivity.author ?? "",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 18.0,
                                  color: Colors.red[600],
                                ),
                                SizedBox(width: 3.0),
                                Text(
                                  "${DateTime.now().difference(DateTime.parse((firstActivity.createdAt ?? "").toString())).inDays} day(s) ago",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Column(
                    children: [
                      for (final activity in otherActivities)
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        StoryPage(storyId: activity.id!),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Icon(
                                      Icons.square,
                                      size: 18.0,
                                      color: Colors.red[600],
                                    ),
                                  ),
                                  SizedBox(width: 4.0),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      activity.title ?? "",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w500,
                                        overflow: TextOverflow.ellipsis,
                                        letterSpacing: 0.1,
                                      ),
                                      maxLines: 3,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Expanded(
                                    flex: 2,
                                    child: AspectRatio(
                                      aspectRatio: 1920 / 1080,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.0,
                                        ),
                                        child: Image.network(
                                          activity.bannerImage ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
