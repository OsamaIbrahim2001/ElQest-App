import '../Models/client_model.dart';
import 'database_handler.dart';

class ClientRepository {
  String tableName = 'clients';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future insert(ClientModel clientModel) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, clientModel.toJson());
    return result;
  }

  Future update({required ClientModel clientModel,required int id}) async {
    print(id);
    print(clientModel.age);
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.update(tableName, clientModel.toJson(),where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future getClient() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName);
    return queryResults.map((e) => ClientModel.fromJson(e)).toList();
  }

  Future delete(int id) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}

