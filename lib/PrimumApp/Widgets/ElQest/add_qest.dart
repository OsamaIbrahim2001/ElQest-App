import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../Contents/Widget/TextField.dart';
import '../../Provider/text_provider.dart';

Widget addQest(context,function,key) {
  final textProvider = Provider.of<TextProvider>(context, listen: true);
  return Directionality(
    textDirection: TextDirection.rtl,
    child: AlertDialog(
      title: const Text("دفع قسط جديد"),
      content: SizedBox(
        height: 250,
        width: 300,
        child: SingleChildScrollView(
          child: Form(
            key: key,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              textFormField(
                text: "تاريخ الدفع",
                controller: textProvider.textEditingController6,
                icon: Icons.date_range_outlined,
                function: ()=>textProvider.showDate(context: context, dateTime: DateTime.now())
              ),
              const SizedBox(height: 10),
              textFormField(
                text: "المبلغ",
                controller: textProvider.textEditingController1,
                icon: Icons.money,
                keyBoard: TextInputType.number
              ),
              const SizedBox(height: 15),
              buildElevatedButton(onPressed: function, text: "دفع", icon: Icons.payment_outlined)
            ],
          )),
        ),
      ),
    ),
  );
}

TextFormField textFormField(
    {required TextEditingController controller,
    required String text,
    required IconData icon,
      TextInputType keyBoard=TextInputType.text,
    VoidCallback? function}) {
  return TextFormField(
    keyboardType: keyBoard,
    onTap:function,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    controller: controller,
    decoration: InputDecoration(
      label: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
      prefixIcon:  Icon(icon),
    ),
    validator: (val) {
      if (val!.isEmpty) {
        return ' اكتب $text';
      }
    },
  );
}
