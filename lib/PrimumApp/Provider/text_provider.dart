import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TextProvider with ChangeNotifier {
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();
  TextEditingController textEditingController4 = TextEditingController();
  TextEditingController textEditingController5 = TextEditingController();
  TextEditingController textEditingController6 = TextEditingController();
  TextEditingController textEditingController7 = TextEditingController();
  var date;

  void resetTextEditing(){
    textEditingController1.clear();
    textEditingController2.clear();
    textEditingController3.clear();
    textEditingController4.clear();
    textEditingController5.clear();
    textEditingController6.clear();
    textEditingController7.clear();
  }

  void showDate({required BuildContext context,required DateTime dateTime}) {
    showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime.parse('1900-01-01'),
      lastDate: dateTime,
    ).then((value) {
     textEditingController6.text = DateFormat.yMMMd().format(value!);
      date=value;
    });
  }


}
