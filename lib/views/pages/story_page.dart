import 'package:agcnews/data/classes/missed_stories_activities.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({super.key, required this.storyId});
  final int storyId;

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  Future<MissedStoryActivity>? story;

  @override
  void initState() {
    print(widget.storyId);
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      story = API.fetchStory(storyId: widget.storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Story"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: story,
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
            final activity = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    Text(activity.title ?? "", style: AgcTextStyle.header1),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Posted on ${DateTime.parse(activity.createdAt!.toString()).day}${AgcDate.getDaySuffix(DateTime.parse(activity.createdAt!.toString()).day)} ${AgcDate.months[DateTime.parse(activity.createdAt!.toString()).month]} ${DateTime.parse(activity.createdAt!.toString()).year}",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${AgcDate.calculateReadTime(activity.content ?? "")} min(s) read",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    AspectRatio(
                      aspectRatio: 1920 / 1080,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          activity.bannerImage ?? "",
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Photo by ${activity.author}",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.1,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      activity.description ?? "",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                      ),
                      softWrap: true,
                    ),
                    Html(
                      data: activity.content ?? "",
                      style: {
                        "*": Style(
                          margin: Margins.only(bottom: 10, top: -20),
                          padding: HtmlPaddings.all(2),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
