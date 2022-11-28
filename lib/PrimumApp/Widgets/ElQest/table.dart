import 'package:flutter/material.dart';

Padding headerTable(String txt) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    child: Text(
      txt,
      style: const TextStyle(
          fontSize: 18,
          color: Color(0xad047d82),
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
  );
}

TableRow buildTableRow(int index, String date, String price) {
  return TableRow(children: [
    Padding(
      padding: const EdgeInsets.all(4),
      child: Text(
        index.toString(),
        textAlign: TextAlign.center,
      ),
    ),
    Text(
      date,
      textAlign: TextAlign.center,
    ),
    Text(
      price,
      textAlign: TextAlign.center,
    ),
  ]);
}