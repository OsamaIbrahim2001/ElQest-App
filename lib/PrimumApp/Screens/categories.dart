import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Contents/Widget/contents.dart';
import '../Provider/db_provider.dart';
import '../Widgets/MainClients/main_appbar.dart';
import '../Widgets/build_dismissible.dart';
import 'add_category.dart';
import 'category_item.dart';
import 'product_detail.dart';

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: buildDismissible(
                      delete: (){},
                        key: dbProvider.categoryList[index].id.toString(),
                        child: InkWell(
                            onTap: () {
                              dbProvider.getProductByCategoryId(
                                  dbProvider.categoryList[index].id!);
                              pushNavigate(context, CategoryItem());
                            },
                            borderRadius: BorderRadius.circular(20),
                            highlightColor: Colors.orange,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 90,
                                    child: Image(
                                      image: MemoryImage(base64Decode(dbProvider
                                          .categoryList[index].image)),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    dbProvider.categoryList[index].name,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                        context: context, edit: (){}),
                  );
                },
                itemCount: dbProvider.categoryList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              )),
          appBar: builAppBar(
              title: 'اصناف المنتجات', condition: 'cat', ctx: context),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              pushNavigate(context, PremiumAddCategory());
            },
            child: const Icon(Icons.add),
          ),
        ));
  }
}
