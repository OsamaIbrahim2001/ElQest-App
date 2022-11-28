import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Contents/Widget/contents.dart';
import '../Provider/db_provider.dart';
import '../Widgets/Products/filter_button.dart';
import '../Widgets/build_dismissible.dart';
import 'product_detail.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("التفاصيل"),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 40,
                  child: Row(
                    children: [
                      buildFilterButton(),
                      const Spacer(),
                      Text(
                        "الكمية   ${dbProvider.length}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.red),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: buildDismissible(
                            edit: (){},
                            delete: (){},
                              key: 'key',
                              child: InkWell(
                                  onTap: () {

                                    dbProvider.getProductByProductId(dbProvider
                                        .productListCategory[index].id!);

                                    pushNavigate(context, ProductDetail());
                                  },
                                  borderRadius: BorderRadius.circular(20),
                                  highlightColor: Colors.orange,
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 110,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: MemoryImage(
                                                      base64Decode(dbProvider
                                                          .productListCategory[
                                                              index]
                                                          .defaultImage)),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(width: 15),
                                        SizedBox(
                                          height: 110,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                dbProvider
                                                    .productListCategory[index]
                                                    .name,
                                                style: const TextStyle(
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Divider(
                                                height: 1,
                                                color: Colors.black,
                                                thickness: 2,
                                              ),
                                              Text(
                                                "الكمية : ${dbProvider.productListCategory[index].quantity}",
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                              const Spacer(),
                                              Text(
                                                "${dbProvider.productListCategory[index].price} جنية",
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        )
                                      ])),
                              context: context));
                    },
                    itemCount: dbProvider.productListCategory.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
