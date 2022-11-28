import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/db_provider.dart';
Widget buildInkWell(String image, int x, context) {
  final dbProvider = Provider.of<DBProvider>(context, listen: true);
  return Row(
    children: [
      const SizedBox(width: 10),
      InkWell(
        onTap: () => dbProvider.indexIndicator(x),
        child: Container(
          height: 70,
          width: 60,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                  color: x == dbProvider.index
                      ? Colors.orangeAccent
                      : Colors.white,
                  width: 1,
                  style: BorderStyle.solid),
              image: DecorationImage(
                  image: MemoryImage(base64Decode(image)),
                  fit: BoxFit.cover)),
        ),
      ),
    ],
  );
}