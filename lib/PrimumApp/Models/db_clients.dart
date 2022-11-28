
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../Screens/main_screen.dart';
import '../Screens/product_screen.dart';

class ClientsProvider with ChangeNotifier{
  Database? database;
  List<Map>clientsList=[];
  List<Map>clientsListSearch=[];
  int currentIndex=0;
  bool isShowBottomSheet = false;
  IconData icon = Icons.add;
  bool search=false;
  List<Map> itemsFiltered = [];
  var date;

bool clickSearch=false;

  TextEditingController searchController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController idController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController workController = TextEditingController();

  void changeBottom(bool bottom, IconData iconData) {
    isShowBottomSheet = bottom;
    icon = iconData;
    notifyListeners();
  }
void isSearch(String txt){
    if(txt.length>0)
      search=true;
}
  changeIndex(index){
    currentIndex=index;
    notifyListeners();
  }
  void changeSearch(){
    clickSearch=!clickSearch;
    notifyListeners();
  }
  void createDatabase() {
    openDatabase('premium.db', version: 1, onCreate: (database, version) {
      print("Database Created");
      database.execute(
          'CREATE TABLE clients(id INTEGER PRIMARY KEY, name TEXT, nid TEXT,phone TEXT,work TEXT,age TEXT,address TEXT)');
      print("clients table Created successfully");

    }, onOpen: (database) {
      print("Database Opened");
      getClients(database);
      // getItems(database);
    }).then((value) {
      database = value;
      notifyListeners();
    });

  }
  void insertLists({required String name,required String address,required String work,required DateTime age,required String nid,required String phone,}) {
    database!
        .rawInsert('INSERT INTO clients (name, nid, phone, work, age,address) VALUES ("$name","$nid","$phone", "$work","$age","$address")')
        .then((value) {
      nameController.text="";
      idController.text="";
      phoneController.text="";
      workController.text="";
      dateController.text="";
      addressController.text="";
      getClients(database);
      notifyListeners();
      print("$value insert successfully");
    }).catchError((error) {
      print('Error When Inserting new row $error');
    });
    nameController.text="";
  }

  void getClients(database){
    database.rawQuery('SELECT * FROM clients').then((value) {
      clientsList=value;
      print(value);
      notifyListeners();
    });
  }

  List<Map> SearchClients(String txt) {
    clientsListSearch = [];
    getClients(database);
    if (clientsList.length > 0) {
      clientsList.forEach((element) {
        if(element['nid'].toString().contains(txt)||element['name'].toString().contains(txt)){
          clientsListSearch.add(element);
        }
      });

    }
    clientsList=clientsListSearch;
    print("After Search $clientsList");
    notifyListeners();
    return clientsList;
  }

  List<Map> filterItems(int id) {
    itemsFiltered = [];
    getClients(database);
    if (clientsList.isNotEmpty) {
      for (var element in clientsList) {
        if (element['id'] == id) {
          itemsFiltered.add(element);
        }
      }
    }
    notifyListeners();
    return itemsFiltered;
  }


}

