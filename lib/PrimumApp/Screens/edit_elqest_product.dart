
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Contents/Widget/TextField.dart';
import '../Models/elqest_model.dart';
import '../Provider/db_provider.dart';
import '../Provider/text_provider.dart';
import '../Provider/widget_provider.dart';
import '../Widgets/Products/dropdown.dart';

class EditElQestScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final widgetProvider = Provider.of<WidgetProvider>(context, listen: true);
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    final textProvider = Provider.of<TextProvider>(context, listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildTextField(controller: TextEditingController(),
                    text: widgetProvider.categoryName!,
                    enabled: false
                  ),
                  DropdownRow(
                    txt: 'اختر الصنف',
                    dSize: MediaQuery.of(context).size,
                    category: widgetProvider.categoryName,
                    categories:[],
                    //dbProvider.categoryList.map((e) => e.name).toList(),
                    onChange: (val) {
                      // widgetProvider.changeCategory(val).then((value) {
                      //   final categoryId = dbProvider.categoryList
                      //       .firstWhere(
                      //           (e) => e.name == widgetProvider.categoryName)
                      //       .id;
                      //   dbProvider.getProductByCategoryId(categoryId!);
                      //   widgetProvider.resetProduct();
                      //   dbProvider.resetImages();
                      // });
                    },
                  ),
                  const SizedBox(height: 15),
                  DropdownRow(
                      txt: 'اختر المنتج',
                      dSize: MediaQuery.of(context).size,
                      category: null,//widgetProvider.productName,
                      categories: [],
                      // List.generate(
                      //     dbProvider.productListCategory.length,
                      //         (index) =>
                      //     dbProvider.productListCategory[index].name),
                      onChange: (val) {
                        // widgetProvider.changeProduct(val);
                        // dbProvider.productQestSelected(val).then((value) {
                        //   dbProvider
                        //       .getImagesProduct(dbProvider.productQest!.id!);
                        //   dbProvider.resetColor();
                        // });
                      }),
                  const SizedBox(height: 15),
                  buildTextField(
                    text: 'السعر',
                    icon: Icons.price_change_outlined,
                    controller: textProvider.textEditingController1,
                    keyboard: TextInputType.number,
                  ),
                  buildTextField(
                    text: 'مقدم القسط',
                    icon: Icons.price_change_outlined,
                    controller: textProvider.textEditingController2,
                    keyboard: TextInputType.number,
                  ),

                  buildTextField(
                      text: 'تاريخ الشراء',
                      icon: Icons.date_range_outlined,
                      controller: textProvider.textEditingController6,
                      keyboard: TextInputType.number,
                      function: () => textProvider.showDate(context: context, dateTime: DateTime.now())),
                  DropdownRow(
                      txt: 'اختر اللون',
                      dSize: MediaQuery.of(context).size,
                      category: null,//dbProvider.color,
                      categories: [],
                      // List.generate(dbProvider.colors.length,
                      //         (index) => dbProvider.colors[index]),
                      onChange: dbProvider.changeColor),
                  const SizedBox(height: 15),
                  // if (dbProvider.imageProductList.isNotEmpty)
                  //   CarouselSlider(
                  //       items: dbProvider.imageProductList
                  //           .map((e) => Image(
                  //           width: double.infinity,
                  //           fit: BoxFit.cover,
                  //           image: MemoryImage(base64Decode(e.image))))
                  //           .toList(),
                  //       options: CarouselOptions(
                  //           height: 150,
                  //           autoPlay: true,
                  //           scrollDirection: Axis.horizontal,
                  //           autoPlayAnimationDuration:
                  //           const Duration(seconds: 1),
                  //           reverse: false,
                  //           initialPage: 0,
                  //           enableInfiniteScroll: true,
                  //           viewportFraction: .8,
                  //           autoPlayCurve: Curves.fastOutSlowIn,
                  //           autoPlayInterval: const Duration(seconds: 3))),
                  // const SizedBox(height: 20),
                  Row(
                    children: [
                      const Text(
                        '  الكمية :',
                        style: TextStyle(fontSize: 22, fontFamily: 'Monadi'),
                      ),
                      IconButton(
                          onPressed: () {
                            widgetProvider.changeQuantity(true);
                          },
                          icon: const Icon(Icons.add)),
                      Text(
                        '${widgetProvider.quantity}',
                        style: const TextStyle(
                            fontSize: 25,
                            fontFamily: 'Monadi',
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      IconButton(
                          onPressed: () {
                            if (widgetProvider.quantity > 1) {
                              widgetProvider.changeQuantity(false);
                            }
                          },
                          icon: Icon(Icons.remove)),
                    ],
                  ),
                  if (dbProvider.productQest != null)
                    if (widgetProvider.quantity >
                        dbProvider.productQest!.quantity)
                      const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "هذه الكمية غير متوفرة حالياٌ",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          )),
                  SizedBox(
                    height: 15,
                  ),
                  if (dbProvider.productQest != null)
                    if (widgetProvider.quantity <=
                        dbProvider.productQest!.quantity)
                      buildElevatedButton(
                          onPressed: () {
                            dbProvider.qestRepository
                                .insert(ElqestModel(
                              clientId: dbProvider.clientDetail!.id!,
                              productId: dbProvider.productQest!.id!,
                              quantity: widgetProvider.quantity,
                              buyDate: textProvider.textEditingController6.text,
                              price: double.parse(
                                  textProvider.textEditingController1.text),
                              firstPayed:
                              textProvider.textEditingController2.text,
                            ))
                                .then((value) {
                              widgetProvider.resetProduct();
                              widgetProvider.resetCategory();
                              textProvider.resetTextEditing();
                              dbProvider
                                  .getElqestClients(
                                  dbProvider.clientDetail!.id!)
                                  .then((value) {
                                dbProvider.getElqestProductsList();
                              });
                              dbProvider.resetColor();
                              dbProvider.resetImages();
                            });
                          },
                          text: 'إتمام الشراء',
                          icon: Icons.payment_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
