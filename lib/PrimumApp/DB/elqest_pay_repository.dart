

import '../Models/elqest_pay.dart';
import 'database_handler.dart';

class ElQestPayRepository {
  String tableName = 'elqestPay';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future<int> insert(ElQestPayModel elQestPayModel) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, elQestPayModel.toJson());
    return result;
  }

  Future retrieve({required int clientId,required int productId,required int elqestId}) async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName,where: 'clientId = ? and productId = ? and elqestId = ?',whereArgs: [clientId,productId,elqestId]);
    return queryResults.map((e) => ElQestPayModel.fromJson(e)).toList();
  }
  Future retrieveAll() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName);
    return queryResults.map((e) => ElQestPayModel.fromJson(e)).toList();
  }


  Future deleteByClientId(int clientId) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'clientId = ?', whereArgs: [clientId]);
  }

  Future deleteByElQestId(int elqestId) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'elqestId = ?', whereArgs: [elqestId]);
  }
}
