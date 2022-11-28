import '../Models/product_model.dart';
import 'database_handler.dart';

class ProductRepository {
  String tableName = 'product';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future<int> insert(ProductModel productModel) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, productModel.toJson());
    return result;
  }

  Future retrieve() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName);
    return queryResults.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future retrieveByCategoryId(int productId) async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db
        .query(tableName, where: 'categoryId = ?', whereArgs: [productId]);
    return queryResults.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future delete(ProductModel productModel) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'id = ?', whereArgs: [productModel.id]);
  }
}
