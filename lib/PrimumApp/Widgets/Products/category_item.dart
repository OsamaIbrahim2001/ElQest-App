import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Contents/Widget/contents.dart';
import '../../Provider/db_provider.dart';
import '../../Screens/category_item.dart';

SizedBox buildCategoryItem(BuildContext context) {
  final dbProvider = Provider.of<DBProvider>(context, listen: true);
  return SizedBox(
    height: 100,
    width: double.infinity,
    child: ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, index) => InkWell(
        onTap: () {
          dbProvider.getProductByCategoryId(dbProvider.categoryList[index].id!);
          pushNavigate(context,  CategoryItem());
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              width: 100,
              height: 100,
              image: MemoryImage(
                  base64Decode(dbProvider.categoryList[index].image)),
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              color: Colors.black.withOpacity(.6),
              width: 100,
              height: 25,
              child: Center(
                child: Text(
                  dbProvider.categoryList[index].name,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
      separatorBuilder: (ctx, index) => const SizedBox(width: 10),
      itemCount: dbProvider.categoryList.length,
    ),
  );
}
