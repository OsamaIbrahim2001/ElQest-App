import 'package:flutter/material.dart';

Row productInfo(String title, String txt) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
      Text(
        txt,
        style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff384e78),
            fontSize: 18),
      )
    ],
  );
}