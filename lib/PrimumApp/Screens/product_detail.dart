import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Contents/Widget/TextField.dart';
import '../Provider/db_provider.dart';
import '../Widgets/Products/image.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: true);

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(base64Decode(dbProvider.image)),
                          fit: BoxFit.cover)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            dbProvider.imageProductList.length,
                            (index) => buildInkWell(
                                dbProvider.imageProductList[index].image,
                                index,
                                context)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                buildRowIndicator(
                    dbProvider.index, dbProvider.imageProductList.length),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15.0, right: 15, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dbProvider.productModel!.name,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Monadi'),
                      ),
                      const SizedBox(height: 5),
                      buildContainerDescription(),
                      const SizedBox(height: 5),
                      Text(
                        dbProvider.productModel!.description,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily: 'Monadi'),
                      ),
                      const SizedBox(height: 10),
                      buildRow(
                          title: "الالوان : ",
                          text: dbProvider.productModel!.color),
                      buildRow(
                          title: "الكمية المتوفرة : ",
                          text: "${dbProvider.productModel!.quantity}"),
                      buildRow(
                          title: "السعر : ",
                          text:
                              " ${dbProvider.productModel!.price}  جنية "),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Row buildRow({required String title, required String text}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, fontFamily: 'Monadi'),
        ),
        Text(
          text,
          style: const TextStyle(
              fontSize: 18, fontFamily: 'Monadi', color: Colors.black87),
        )
      ],
    );
  }

  Container buildContainerDescription() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.35),
            borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.only(right: 5),
        width: double.infinity,
        child: Row(
          children: const [
            Icon(
              Icons.description_outlined,
              color: Colors.blue,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "الوصف",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ));
  }
}
