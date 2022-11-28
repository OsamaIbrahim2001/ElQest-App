import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Contents/Widget/TextField.dart';
import 'DB/client_repository.dart';
import 'Provider/db_provider.dart';
import 'Provider/text_provider.dart';

class EditClients extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  final txtName = TextEditingController();
  final txtPhone = TextEditingController();
  final txtId = TextEditingController();
  final txtJob = TextEditingController();
  final txtAddress = TextEditingController();
  final txtDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textProvider = Provider.of<TextProvider>(context);
    final dbProvider = Provider.of<DBProvider>(context);
    final client = dbProvider.clientsList
        .firstWhere((element) => element.id == dbProvider.clientDetail!.id!);
    print(client.name);
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
                      function: () => textProvider.showDate(
                          context: context,
                          dateTime: DateTime.parse(
                              '${DateTime.now().year - 16}-${(DateTime.now().month) > 9 ? (DateTime.now().month) : '0${(DateTime.now().month)}'}-${(DateTime.now().day) > 9 ? (DateTime.now().day) : '0${(DateTime.now().day)}'}'))),
                  const SizedBox(height: 30),
                  buildElevatedButton(
                      onPressed: () {
                        if (!formKey.currentState!.validate()) return;
                        client.name = textProvider.textEditingController1.text;
                        client.nid = textProvider.textEditingController2.text;
                        client.phone = textProvider.textEditingController3.text;
                        client.job = textProvider.textEditingController4.text;
                        client.address =
                            textProvider.textEditingController5.text;
                        client.age = textProvider.date.toString();
                        final clientRepository = ClientRepository();
                        final clientModel=dbProvider.clientDetail!;
                        clientModel.name = textProvider.textEditingController1.text;
                        clientModel.nid = textProvider.textEditingController2.text;
                        clientModel.phone = textProvider.textEditingController3.text;
                        clientModel.job = textProvider.textEditingController4.text;
                        clientModel.address =
                            textProvider.textEditingController5.text;
                        clientModel.age = textProvider.date.toString();
                        clientRepository
                            .update(
                                id: dbProvider.clientDetail!.id!,
                                clientModel: clientModel)
                            .then((value) => dbProvider.getClientData());
                        textProvider.resetTextEditing();
                      },
                      text: "حفظ البيانات",
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
