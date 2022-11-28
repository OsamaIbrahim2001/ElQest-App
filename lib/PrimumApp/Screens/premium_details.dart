import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/elqest_pay.dart';
import '../Provider/db_provider.dart';
import '../Provider/text_provider.dart';
import '../Provider/widget_provider.dart';
import '../Widgets/ElQest/add_qest.dart';
import '../Widgets/ElQest/delete_qest.dart';
import '../Widgets/ElQest/product_info.dart';
import '../Widgets/ElQest/table.dart';

class PremiumDetails extends StatelessWidget {
  final String productName;
  var formKey = GlobalKey<FormState>();

  PremiumDetails(this.productName);

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: true);
    final dbProvider = Provider.of<DBProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            dbProvider.clientDetail!.name,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w800, color: Colors.black),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (x) {
                if (x == 'add') {
                  showDialog(
                      context: context,
                      builder: (ctx) => addQest(context, () {
                            if (formKey.currentState!.validate()) {
                              dbProvider.qestPayRepository
                                  .insert(ElQestPayModel(
                                clientId: dbProvider.elqestModel!.clientId,
                                productId: dbProvider.elqestModel!.productId,
                                payDate:
                                    textProvider.textEditingController6.text,
                                price: double.parse(
                                    textProvider.textEditingController1.text),
                                elqestId: dbProvider.elqestModel!.id!,
                              ))
                                  .then((value) {
                                textProvider.resetTextEditing();
                                dbProvider.getElQestPay(
                                  clientId: dbProvider.elqestModel!.clientId,
                                  productId: dbProvider.elqestModel!.productId,
                                  elqestId: dbProvider.elqestModel!.id!,
                                );
                              });
                              Navigator.of(context).pop();
                            }
                          }, formKey));
                } else {
                  if (dbProvider.elqestPayModelList.isEmpty) {
                  } else {
                    showDialog(
                        context: context,
                        builder: (ctx) => dialogDelete(function: () {
                          dbProvider.qestPayRepository
                              .deleteByClientId(dbProvider
                              .elqestPayModelList.last.id!)
                              .then((value) {
                            dbProvider.getElQestPay(
                              clientId:
                              dbProvider.elqestModel!.clientId,
                              productId:
                              dbProvider.elqestModel!.productId,
                              elqestId: dbProvider.elqestModel!.id!,
                            );
                          });
                          Navigator.of(context).pop();
                        }, context: context, title: 'هل تريد حذف اخر قسط تم دفعة'));
                  }
                }
              },
              itemBuilder: (BuildContext context) {
                return widgetProvider.menuItems.toList();
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              Text(
                productName,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blue,
                    fontSize: 25),
                maxLines: 2,
              ),
              const SizedBox(height: 10),
              productInfo("السعر : ", "${dbProvider.elqestModel!.price} جنية"),
              productInfo("الكمية : ", "${dbProvider.elqestModel!.quantity}"),
              productInfo("تاريخ الشراء : ", dbProvider.elqestModel!.buyDate),
              productInfo(
                  "المقدم : ", "${dbProvider.elqestModel!.firstPayed} جنية"),
              productInfo("المبلغ المدفوع : ", "${dbProvider.payed()} جنية"),
              productInfo("المبلغ المتبقي : ", "${dbProvider.remained()} جنية"),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(children: [
                  InteractiveViewer(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: Colors.black45,
                          width: 2,
                        ),
                        columnWidths: const {
                          0: IntrinsicColumnWidth(flex: 1),
                          1: IntrinsicColumnWidth(flex: 4),
                          2: IntrinsicColumnWidth(flex: 4),
                        },
                        defaultColumnWidth: const IntrinsicColumnWidth(),
                        children: [
                          TableRow(children: [
                            headerTable("العدد"),
                            headerTable("تاريخ الدفع"),
                            headerTable("المبلغ"),
                          ]),
                          ...List.generate(
                              dbProvider.elqestPayModelList.length,
                              (index) => buildTableRow(
                                  index + 1,
                                  dbProvider.elqestPayModelList[index].payDate,
                                  "${dbProvider.elqestPayModelList[index].price}")),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
