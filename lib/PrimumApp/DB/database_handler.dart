import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    final path = await getDatabasesPath();
    return openDatabase(join(path, 'qastly.db'), version: 1,
        onCreate: (database, version) async {
      Batch batch = database.batch();
      batch.execute(
          'CREATE TABLE clients(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,nid TEXT NOT NULL,phone TEXT NOT NULL,job TEXT NOT NULL,address TEXT NOT NULL,age TEXT NOT NULL)');
      batch.execute(
          'CREATE TABLE category(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,image TEXT NOT NULL)');
      batch.execute(
          'CREATE TABLE product(id INTEGER PRIMARY KEY AUTOINCREMENT, categoryId INTEGER NOT NULL, name TEXT NOT NULL, description TEXT NOT NULL, price DOUBLE NOT NULL, color TEXT NOT NULL, defaultImage TEXT NOT NULL, quantity INTEGER NOT NULL)');
      batch.execute(
          'CREATE TABLE image(id INTEGER PRIMARY KEY AUTOINCREMENT, image TEXT NOT NULL, productId INTEGER NOT NULL)');
      batch.execute(
          'CREATE TABLE elqest(id INTEGER PRIMARY KEY AUTOINCREMENT,clientId INTEGER NOT NULL,productId INTEGER NOT NULL, buyDate TEXT NOT NULL, price DOUBLE NOT NULL, quantity INTEGER NOT NULL, firstPayed TEXT NOT NULL)');
      batch.execute(
          'CREATE TABLE elqestPay(id INTEGER PRIMARY KEY AUTOINCREMENT,clientId INTEGER NOT NULL,productId INTEGER NOT NULL,elqestId INTEGER NOT NULL, payDate TEXT NOT NULL, price DOUBLE NOT NULL)');
      await batch.commit();
    });
  }
}
