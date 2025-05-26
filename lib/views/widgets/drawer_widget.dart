import 'package:agcnews/data/classes/category_type_activity.dart';
import 'package:agcnews/data/endpoints.dart';
import 'package:agcnews/views/pages/home_page.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? menuItem = 'e1';

  Future<List<CategoryTypeActivity>>? categories;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() {
    setState(() {
      categories = API.fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20.0),
          ListTile(
            title: Text("Home", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Select a media type",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text("Audio", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.audio_file),
            onTap: () {},
          ),
          ListTile(
            title: Text("Video", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.video_camera_back),
            onTap: () {},
          ),
          ListTile(
            title: Text("Photos", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.photo),
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Select a category",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
            future: categories,
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
                      ListTile(
                        title: Text(
                          activity.categoryName,
                          style: TextStyle(fontSize: 15.0),
                        ),
                        leading: Icon(Icons.category),
                        onTap: () {},
                      ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
