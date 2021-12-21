import 'package:flutter/material.dart';

///Takes context, text, textColor, bgColor to show a standard snackbar.
void showSnackBar(
    BuildContext context, String text, Color textColor, Color bgColor) {
  final snackBar = new SnackBar(
    duration: Duration(seconds: 2),
    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w400),
        ),
      ],
    ),
    backgroundColor: bgColor,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
  //Scaffold.of(context).showSnackBar(snackBar);
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
