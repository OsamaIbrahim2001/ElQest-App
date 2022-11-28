import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Contents/Widget/contents.dart';
import '../../Models/product_model.dart';
import '../../Provider/db_provider.dart';
import '../../Screens/product_detail.dart';

Widget ProductItem({required BuildContext context,required ProductModel model}) {
  final dbProvider = Provider.of<DBProvider>(context, listen: true);
  return InkWell(
    onTap: () {
      dbProvider.getProductByProductId(model.id!);
      pushNavigate(context, ProductDetail());
    },
    child: Column(
      children: [
         Image(
          width: double.infinity,
          height: 160,
          image: MemoryImage(base64Decode(model.defaultImage)),
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
               model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold, height: 1.3),
              ),
              Row(
                children:  [
                  Text(
                    "${model.price} جنية",
                    style: const TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}