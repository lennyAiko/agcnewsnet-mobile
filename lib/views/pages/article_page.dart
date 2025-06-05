import 'package:agcnews/data/constants.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Articles"),
        centerTitle: true,
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.0),
              Text("Latest Articles", style: AgcTextStyle.header1),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
