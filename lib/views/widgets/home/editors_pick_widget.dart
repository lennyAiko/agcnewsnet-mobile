import 'package:flutter/material.dart';

class EditorsPickWidget extends StatefulWidget {
  const EditorsPickWidget({super.key});

  @override
  State<EditorsPickWidget> createState() => _EditorsPickWidgetState();
}

class _EditorsPickWidgetState extends State<EditorsPickWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Hero(
          tag: "editorsPick",
          child: AspectRatio(
            aspectRatio: 1920 / 1080,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "assets/images/agcnewslogo.png",
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
                  Icon(Icons.king_bed_rounded, color: Colors.white, size: 20.0),
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
    );
  }
}
