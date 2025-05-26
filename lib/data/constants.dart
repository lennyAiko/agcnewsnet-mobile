import 'package:flutter/material.dart';

class AgcTextStyle {
  static const TextStyle header1 = TextStyle(
    fontSize: 20.0,
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

class AgcDate {
  static String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  static const List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  static calculateReadTime(String text) {
    int words = text.split(" ").length;
    int mins = (words / 200).ceil();
    return mins;
  }
}
