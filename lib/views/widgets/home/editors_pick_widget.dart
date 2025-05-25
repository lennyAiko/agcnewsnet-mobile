import 'package:agcnews/data/classes/editors_pick_activity.dart';
import 'package:agcnews/data/constants.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:flutter/material.dart';

class EditorsPickWidget extends StatefulWidget {
  const EditorsPickWidget({super.key});

  @override
  State<EditorsPickWidget> createState() => _EditorsPickWidgetState();
}

class _EditorsPickWidgetState extends State<EditorsPickWidget> {
  Future<List<EditorsPickActivity>>? editorsPick;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      editorsPick = API.fetchEditorsPick();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: editorsPick,
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
          final activity = snapshot.data!.first;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Hero(
                    tag: "editorsPick",
                    child: AspectRatio(
                      aspectRatio: 1920 / 1080,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          activity.story!.bannerImage ?? "",
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
                          border: Border.all(color: Colors.white, width: 1.0),
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.black38,
                        ),
                        padding: EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.king_bed_rounded,
                              color: Colors.white,
                              size: 20.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Editor's Pick",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(activity.story!.title ?? "", style: AgcTextStyle.header3),
              SizedBox(height: 5.0),
              Text(
                activity.story!.description ?? "",
                style: AgcTextStyle.description,
                maxLines: 2,
              ),
              SizedBox(height: 5.0),
              Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 20.0,
                    color: Color.fromRGBO(248, 95, 208, 1),
                  ),
                  SizedBox(width: 3.0),
                  Text(
                    activity.story!.author ?? "",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                    ),
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
