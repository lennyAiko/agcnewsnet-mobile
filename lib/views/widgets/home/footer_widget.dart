import 'package:flutter/material.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "© 2025 AGC Newsnet. All Rights Reserved.",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}
