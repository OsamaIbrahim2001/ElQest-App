import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'db_provider.dart';
import 'text_provider.dart';
import 'widget_provider.dart';

Future editClient(context) async{
  final textProvider = Provider.of<TextProvider>(context, listen: false);
  final dbProvider = Provider.of<DBProvider>(context, listen: false);

  textProvider.textEditingController1.text = dbProvider.clientDetail!.name;
  textProvider.textEditingController2.text = dbProvider.clientDetail!.nid;
  textProvider.textEditingController3.text = dbProvider.clientDetail!.phone;
  textProvider.textEditingController4.text = dbProvider.clientDetail!.job;
  textProvider.textEditingController5.text = dbProvider.clientDetail!.address;

}

Future editElqestProduct({required int id,required BuildContext context}) async{
  final textProvider = Provider.of<TextProvider>(context, listen: false);
  final dbProvider = Provider.of<DBProvider>(context, listen: false);
  final widgetProvider = Provider.of<WidgetProvider>(context, listen: false);

  widgetProvider.categoryName=dbProvider.categoryList.firstWhere((element) => element.id==id).name;
  textProvider.textEditingController1.text = dbProvider.elqestModel!.price.toString();
  textProvider.textEditingController2.text = dbProvider.elqestModel!.firstPayed.toString();
  widgetProvider.quantity=dbProvider.elqestModel!.quantity;
}
