import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text("About"),
              leading: Icon(Icons.info),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TOP STORIES",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 5.0),
              AspectRatio(
                aspectRatio: 1920 / 1080,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    "assets/images/agcnewslogo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                "LATEST TODAY",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(248, 95, 208, 1),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "Putin promises grains, debt write-off as Russia seeks Africa allies",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
