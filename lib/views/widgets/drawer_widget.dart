import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? menuItem = 'e1';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(height: 20.0),
          ListTile(
            title: Text("Home", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.home),
            onTap: () {},
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
          ListTile(
            title: Text("Photos", style: TextStyle(fontSize: 15.0)),
            leading: Icon(Icons.category),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
