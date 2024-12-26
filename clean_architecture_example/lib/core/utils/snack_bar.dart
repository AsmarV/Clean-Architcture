import 'package:clean_architecture_example/core/core.export.dart';
import 'package:flutter/material.dart';

enum SnackBarStatus {
  Error,
  Success,
  Warning,
  Update,
}

///CUSTOM SNACK-BAR TO ALL SCAFFOLD
void appSnackBar({required String title, required SnackBarStatus type}) {
  scaffoldKey.currentState!.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: getColorSnackBar(type),
      duration: Duration(milliseconds: type == SnackBarStatus.Error ? 2000 : 800),
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: font(0.28)),
            ),
          ),
        ],
      )));
}

///COLORS BY TYPE
Color getColorSnackBar(SnackBarStatus type) {
  switch (type) {
    case SnackBarStatus.Error:
      return Colors.red.shade900;
    case SnackBarStatus.Warning:
      return Colors.yellow.shade900;
    case SnackBarStatus.Success:
      return Colors.green.shade900;
    case SnackBarStatus.Update:
      return Colors.blueGrey.shade900;
    default:
      return Colors.black87;
  }
}

///ICON BY TYPE
Widget getIconSnackBar(SnackBarStatus type) {
  switch (type) {
    case SnackBarStatus.Error:
      return Icon(
        Icons.cancel_outlined,
        color: Colors.white,
        size: font(0.4),
      );
    case SnackBarStatus.Warning:
      return Icon(
        Icons.warning_amber_rounded,
        color: Colors.white,
        size: font(0.4),
      );
    case SnackBarStatus.Success:
      return Icon(
        Icons.check_circle_outline,
        color: Colors.white,
        size: font(0.4),
      );
    case SnackBarStatus.Update:
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
