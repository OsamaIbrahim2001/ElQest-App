import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Contents/Widget/TextField.dart';
import '../DB/image_product_repository.dart';
import '../DB/product_repository.dart';
import '../Models/image_model.dart';
import '../Models/product_model.dart';
import '../Provider/add_image_provider.dart';
import '../Provider/db_provider.dart';
import '../Provider/text_provider.dart';
import '../Provider/widget_provider.dart';
import '../Widgets/Products/dropdown.dart';

class AddProduct extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);
    final dbProvider = Provider.of<DBProvider>(context);
    final imageProvider = Provider.of<AddImageProvider>(context);
    final widgetProvider = Provider.of<WidgetProvider>(context);
    textProvider.resetTextEditing();
    dbProvider.resetImages();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "إضافة منتج جديد",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 30),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  DropdownRow(
                    txt: 'اختر الصنف',
                    dSize: MediaQuery.of(context).size,
                    category: widgetProvider.categoryName,
                    categories:
                        dbProvider.categoryList.map((e) => e.name).toList(),
                    onChange: widgetProvider.changeCategory,
                  ),
                  const SizedBox(height: 20),
                  buildTextField(
                    controller: textProvider.textEditingController1,
                    text: 'اسم المنتج',
                    icon: Icons.production_quantity_limits,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    controller: textProvider.textEditingController2,
                    text: 'الوصف',
                    icon: Icons.description_rounded,
                    maxLength: 300,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    controller: textProvider.textEditingController3,
                    icon: (Icons.price_change),
                    text: 'السعر',
                    keyboard: TextInputType.number,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                      controller: textProvider.textEditingController4,
                      icon: (Icons.color_lens),
                      text: 'الالوان'),
                  const SizedBox(height: 15),
                  buildTextField(
                      controller: textProvider.textEditingController5,
                      icon: (Icons.format_list_numbered_sharp),
                      keyboard: TextInputType.number,
                      text: 'الكمية'),
                  const SizedBox(height: 15),
                  SizedBox(
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        if (imageProvider.imageFile.length <= 5)
                          InkWell(
                            onTap: () {
                              imageProvider.pickMultiImage();
                            },
                            child: Container(
                              height: 80,
                              width: 55,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.blue)),
                              child: const Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ...imageProvider.imageFile.map(
                          (e) => Stack(children: [
                            Container(
                              height: 90,
                              width: 60,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFF48907E))),
                              child: Image.file(
                                e,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 3, right: 3),
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54),
                                child: InkWell(
                                    onTap: () {
                                      imageProvider.removeImageFromList(e);
                                    },
                                    child: Icon(
                                      Icons.clear_rounded,
                                      size: 15,
                                      color: Colors.white,
                                    )))
                          ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  buildElevatedButton(
                      onPressed: () async {
                        int productId = 0;
                        if (formKey.currentState!.validate()) {
                          if (imageProvider.listImageCompressed.isEmpty ||
                              widgetProvider.categoryName == null) {
                            widgetProvider.showMessageDialog(
                                context, 'املأ الحقول الفارغة', true);
                          } else {
                            final categoryId = dbProvider.categoryList
                                .firstWhere((e) =>
                                    e.name == widgetProvider.categoryName)
                                .id;
                            final product = ProductRepository();

                            productId = await product.insert(ProductModel(
                              quantity: int.parse(
                                  textProvider.textEditingController5.text),
                              name: textProvider.textEditingController1.text,
                              description:
                                  textProvider.textEditingController2.text,
                              color: textProvider.textEditingController4.text,
                              price: double.parse(
                                  textProvider.textEditingController3.text),
                              defaultImage:
                                  imageProvider.listImageCompressed[0],
                              categoryId: categoryId!,
                            ));
                            dbProvider.insertImage(
                                imageProvider.listImageCompressed, productId);
                            textProvider.resetTextEditing();
                            widgetProvider.resetCategory();
                            imageProvider.resetData();
                            dbProvider.getProducts();
                          }
                        }
                      },
                      text: "حفظ المنتج",
                      icon: Icons.save_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
