import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  bool clickSearch = false;
  int currentIndex = 0;
  String? categoryName;
  String? productName;
  int quantity=1;


  final List<PopupMenuItem<String>> menuItems = [
    const PopupMenuItem(
      child: Text("إضافة",style: TextStyle(fontFamily: 'Monadi',fontSize: 18),),
      value: 'add',
    ),
    const PopupMenuItem(
      child: Text("حذف",style: TextStyle(fontFamily: 'Monadi',fontSize: 18),),
      value: 'remove',
    ),
  ];

  void changeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }

  void changeClickSearch() {
    clickSearch = !clickSearch;
    notifyListeners();
  }

  Future changeCategory(String? value) async{
    categoryName = value!;

    notifyListeners();
  }

  Future changeProduct(String? value) async{
    productName = value!;
    notifyListeners();
  }

  void resetCategory() {
    categoryName=null;
    notifyListeners();
  }
  void resetProduct() {
    productName=null;
    notifyListeners();
  }

  void showMessageDialog(BuildContext context, String message, bool dismissible,
      {String title = 'حدث خطأ !'}) {
    showDialog(
        context: context,
        barrierDismissible: dismissible,
        builder: (ctx) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text(
              title,
            ),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('تم'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
  }
  void changeQuantity(bool plus){
    plus==true?quantity++:quantity--;
    notifyListeners();
  }

}
