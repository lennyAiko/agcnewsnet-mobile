import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
