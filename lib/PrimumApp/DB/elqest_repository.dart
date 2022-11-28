

import '../Models/elqest_model.dart';
import '../Models/product_model.dart';
import 'database_handler.dart';

class ElQestRepository {
  String tableName = 'elqest';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future<int> insert(ElqestModel elqestModel) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, elqestModel.toJson());
    return result;
  }

  Future retrieve() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName);
    return queryResults.map((e) => ElqestModel.fromJson(e)).toList();
  }

  Future retrieveClientId(int clientId) async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db
        .query(tableName, where: 'clientId = ?', whereArgs: [clientId]);
    return queryResults.map((e) => ElqestModel.fromJson(e)).toList();
  }

  Future deleteByClientId(int clientId) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'clientId = ?', whereArgs: [clientId]);
  }

  Future delete(int id) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
