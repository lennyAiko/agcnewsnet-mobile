import 'package:flutter/material.dart';

class AgcTextStyle {
  static const TextStyle header1 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w900,
  );
  static const TextStyle header2 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w500,
    color: Color.fromRGBO(248, 95, 208, 1),
  );
  static const TextStyle header3 = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    overflow: TextOverflow.ellipsis,
    letterSpacing: 0.1,
  );
  static const TextStyle description = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    letterSpacing: 0.1,
  );
}
