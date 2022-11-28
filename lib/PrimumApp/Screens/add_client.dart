import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Contents/Widget/TextField.dart';
import '../DB/client_repository.dart';
import '../Models/client_model.dart';
import '../Provider/db_provider.dart';
import '../Provider/text_provider.dart';

class AddClients extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);
    final dbProvider = Provider.of<DBProvider>(context);
    textProvider.resetTextEditing();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "إضافة شخص جديد",
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
                  buildTextField(
                    controller: textProvider.textEditingController1,
                    text: 'الاسم ثلاثي',
                    icon: Icons.title,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                    controller: textProvider.textEditingController2,
                    text: 'الرقم القومي',
                    icon: Icons.numbers,
                    keyboard: TextInputType.number,
                    maxLength: 14,
                  ),
                  const SizedBox(height: 15),
                  buildTextField(
                      controller: textProvider.textEditingController3,
                      icon: (Icons.phone),
                      text: 'الموبايل',
                      keyboard: TextInputType.number,
                      maxLength: 11),
                  const SizedBox(height: 15),
                  buildTextField(
                      controller: textProvider.textEditingController4,
                      icon: (Icons.work_history),
                      text: 'الوظيفة'),
                  const SizedBox(height: 15),
                  buildTextField(
                      controller: textProvider.textEditingController5,
                      icon: (Icons.location_city),
                      text: 'العنوان'),
                  const SizedBox(height: 15),
                  buildTextField(
                      text: 'تاريخ الميلاد',
                      icon: Icons.date_range_outlined,
                      controller: textProvider.textEditingController6,
                      function: () => textProvider.showDate(context: context, dateTime: DateTime.parse(
                          '${DateTime.now().year - 16}-${(DateTime.now().month) > 9 ? (DateTime.now().month) : '0${(DateTime.now().month)}'}-${(DateTime.now().day) > 9 ? (DateTime.now().day) : '0${(DateTime.now().day)}'}'))),
                  const SizedBox(height: 30),
                  buildElevatedButton(onPressed: (){
                    if (formKey.currentState!.validate()) {
                      final client = ClientRepository();
                      client
                          .insert(ClientModel(
                        name: textProvider.textEditingController1.text,
                        nid: textProvider.textEditingController2.text,
                        phone: textProvider.textEditingController3.text,
                        job: textProvider.textEditingController4.text,
                        address: textProvider.textEditingController5.text,
                        age: textProvider.date.toString(),
                      ))
                          .then((value) => dbProvider.getClientData());
                      textProvider.resetTextEditing();
                    }
                  },text: "حفظ البيانات",icon: Icons.save_outlined)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}

