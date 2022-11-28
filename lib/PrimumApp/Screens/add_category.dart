import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../Contents/Widget/TextField.dart';
import '../DB/category_repository.dart';
import '../Models/category_model.dart';
import '../Provider/add_image_provider.dart';
import '../Provider/db_provider.dart';
import '../Provider/text_provider.dart';

class PremiumAddCategory extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    final textProvider = Provider.of<TextProvider>(context, listen: false);
    final imageProvider = Provider.of<AddImageProvider>(context, listen: true);
    final dbProvider = Provider.of<DBProvider>(context, listen: true);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xFF015C92),
                Color(0xFF2D82B5),
                Color(0xFF69A6CD),
                Color(0xFF88CDF6),
                Color(0xFFBCE6FF),
              ])),
          child: Center(
            child: Container(
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTextField(
                        controller: textProvider.textEditingController1,
                        text: 'اضف صنف للمنتجات',
                        icon: Icons.category,
                      ),
                      SizedBox(
                        width: dSize.width * 0.6,
                        child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            alignment: WrapAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  imageProvider.pickImage();
                                },
                                child: Container(
                                  height: 100,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: Colors.blue, width: 2)),
                                  child: Icon(
                                    Icons.add_a_photo_outlined,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ),
                              ...imageProvider.imageFile
                                  .map(
                                    (e) => Container(
                                      height: 90,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.file(
                                        e,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                  .toList()
                            ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      buildElevatedButton(
                          onPressed: () {
                            if (imageProvider.imageFile.isNotEmpty) {
                              if (formKey.currentState!.validate()) {
                                final categoryRepository = CategoryRepository();
                                categoryRepository
                                    .insert(CategoryModel(
                                        name: textProvider
                                            .textEditingController1.text,
                                        image: imageProvider.imageCompressed))
                                    .then((value) {
                                  dbProvider.getCategory();
                                  imageProvider.resetData();
                                  textProvider.resetTextEditing();
                                });
                              }
                            }
                          },
                          text: 'إضافة صنف',
                          icon: Icons.save)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
