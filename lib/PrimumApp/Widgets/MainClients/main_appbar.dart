import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Models/db_clients.dart';
import '../../Provider/db_provider.dart';
import '../../Provider/widget_provider.dart';

AppBar builAppBar(
    {required BuildContext ctx,
    required String title,
    required String condition}) {
  final widgetProvider = Provider.of<WidgetProvider>(ctx, listen: true);
  final dbProvider = Provider.of<DBProvider>(ctx, listen: true);
  return AppBar(
    title: !widgetProvider.clickSearch
        ? Row(
            children: [
              IconButton(
                onPressed: () => widgetProvider.changeClickSearch(),
                icon: const Icon(Icons.search,color: Colors.blue,),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              )
            ],
          )
        : TextFormField(
            onChanged: (txt) {
              if (condition == 'main') {
                if (txt == '') {
                  dbProvider.getClientData();
                } else {
                  dbProvider.searchClients(txt);
                }
              } else if (condition == 'cat') {
                if (txt == '') {
                  dbProvider.getCategory();
                } else {
                  dbProvider.searchCategory(txt);
                }
              } else if (condition == 'prod') {
                if (txt == '') {
                  dbProvider.getProducts();
                } else {
                  dbProvider.searchProducts(txt);
                }
              } else {
                ;
              }
            },
            decoration: InputDecoration(
                focusColor: Colors.red,
                hintText: "بحث",
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 20),
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    widgetProvider.changeClickSearch();
                    if (condition == 'main') {
                      dbProvider.getClientData();
                    } else if (condition == 'cat') {
                      dbProvider.getCategory();
                    } else if (condition == 'prod') {
                    } else {}
                  },
                  icon: const Icon(Icons.arrow_forward_ios_sharp),
                )),
            textInputAction: TextInputAction.search,
            style: const TextStyle(color: Colors.red, fontSize: 18),
            cursorColor: Colors.red,
          ),
    elevation: 0,
  );
}
