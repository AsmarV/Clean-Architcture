

import 'package:clean_architecture_example/core/core.export.dart';
import 'package:flutter/material.dart';


import '../constants/constants.export.dart';


///CUSTOM SNACK-BAR TO ALL SCAFFOLD
void appSnackBar({required String title, required String type}) {
  scaffoldKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: getColorSnackBar(type),
      duration: Duration(milliseconds: type == "error" ? 2000 : 800),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.only(bottom: sized16(), top: sized16()),
      margin: const EdgeInsets.only(
        bottom: 30,
        right: 18,
        left: 18,
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 8,
          ),
          CircleAvatar(
            radius: 10,
            backgroundColor: Colors.black12,
            child: getIconSnackBar(type),
          ),
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: Text(
              "${getMessages(title)}",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: font(0.28)),
            ),
          ),
        ],
      )));
}

///COLORS BY TYPE
Color getColorSnackBar(String type) {
  final String convert = type.toLowerCase();

  switch (convert) {
    case "error":
      return Colors.red.shade900;
    case "warning":
      return Colors.yellow.shade900;
    case "success":
      return Colors.green.shade900;
    case "update":
      return Colors.blueGrey.shade900;
    default:
      return Colors.black87;
  }
}

///ICON BY TYPE
Widget getIconSnackBar(String type) {
  final String convert = type.toLowerCase();

  switch (convert) {
    case "error":
      return Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: font(0.4),
      );
    case "warning":
      return Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
        size: font(0.4),
      );
    case "success":
      return Icon(
        Icons.check_circle_outline,
        color: Colors.white,
        size: font(0.4),
      );
    case "update":
      return Icon(
        Icons.update_rounded,
        color: Colors.white,
        size: font(0.4),
      );
    default:
      return Icon(
        Icons.deblur,
        color: Colors.white,
        size: font(0.4),
      );
  }
}