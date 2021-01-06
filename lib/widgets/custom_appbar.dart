import 'package:flutter/material.dart';

Widget customAppBar(String title,Widget leading) {
  return AppBar(
    leading: leading,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.red[700],
    title: Text(title),
    actions: [
      SizedBox(
        width: 20,
      ),
    ],
  );
}
