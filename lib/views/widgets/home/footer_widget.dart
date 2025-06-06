import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({super.key});

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "© 2025 AGC Newsnet. All Rights Reserved.",
            style: TextStyle(color: Colors.black54),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.facebook),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.instagram),
              ),
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.twitter),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
