import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Contents/Widget/contents.dart';
import '../Provider/db_provider.dart';
import '../Provider/edit_data.dart';
import '../Provider/widget_provider.dart';
import '../Widgets/build_dismissible.dart';
import 'add_qest_screen.dart';
import 'edit_elqest_product.dart';
import 'premium_details.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: true);
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
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                height: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dbProvider.clientDetail!.name,
                          style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF091A39)),
                        ),
                        buildRow(
                            title: "الرقم القومي : ",
                            text: dbProvider.clientDetail!.nid),
                        buildRow(
                            title: "الوظيفة : ",
                            text: dbProvider.clientDetail!.job),
                        buildRow(
                            title: "العمر : ",
                            text:
                            "  ${((DateTime.now().difference(
                                DateTime.parse(dbProvider.clientDetail!.age)))
                                .inHours / 24 / 365.25).round()} سنة"),
                        buildRow(
                            title: "العنوان : ",
                            text: dbProvider.clientDetail!.address),
                      ]),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: buildDismissible(
                            edit: () {
                              dbProvider
                                  .getElqestModel(
                                  dbProvider.elqestList[index].id!)
                                  .then((value) {
                                dbProvider.getElQestPay(
                                  clientId: dbProvider.elqestModel!
                                      .clientId,
                                  productId: dbProvider.elqestModel!
                                      .productId,
                                  elqestId: dbProvider.elqestModel!.id!,);
                                editElqestProduct(id: 2, context: context);
                                pushNavigate(
                                    context,
                                    EditElQestScreen());
                              });
                            },
                            delete: () {
                              dbProvider.deleteElQestProduct(
                                  elqestId: dbProvider.elqestList[index].id!,
                                  index: index).then((value) {
                                    Navigator.of(context).pop();
                              });
                            },
                            key: dbProvider.elqestList[index].id!.toString(),
                            child: InkWell(
                                onTap: () {
                                  dbProvider
                                      .getElqestModel(
                                      dbProvider.elqestList[index].id!)
                                      .then((value) {
                                    dbProvider.getElQestPay(
                                      clientId: dbProvider.elqestModel!
                                          .clientId,
                                      productId: dbProvider.elqestModel!
                                          .productId,
                                      elqestId: dbProvider.elqestModel!.id!,);
                                    pushNavigate(
                                        context,
                                        PremiumDetails(dbProvider
                                            .elqestProductsList[index].name));
                                  });
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
                                                image: MemoryImage(base64Decode(
                                                    dbProvider
                                                        .elqestProductsList[
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
                                                  .elqestProductsList[index]
                                                  .name,
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: Colors.black,
                                              thickness: 2,
                                            ),
                                            Text(
                                              "الكمية : ${dbProvider
                                                  .elqestList[index].quantity}",
                                              style:
                                              const TextStyle(fontSize: 18),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${dbProvider.elqestList[index]
                                                  .price} جنية",
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
                  itemCount: dbProvider.elqestList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            widgetProvider.resetCategory();
            widgetProvider.resetProduct();
            dbProvider.resetImages();
            pushNavigate(context, AddQestScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Row buildRow({required String title, required String text}) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF08425C)),
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ],
    );
  }
}
