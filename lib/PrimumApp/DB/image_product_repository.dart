

import '../Models/image_model.dart';
import 'database_handler.dart';

class ImageProductRepository {
  String tableName = 'image';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future insert(ImageProductModel imageProductModel) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, imageProductModel.toJson());
    return result;
  }


  Future retrieveByProduct(int productId) async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db
        .query(tableName, where: 'productId = ?', whereArgs: [productId]);
    return queryResults.map((e) => ImageProductModel.fromJson(e)).toList();
  }

  Future<int> batch(List<ImageProductModel> images) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    for (var image in images) {
      result = await db.insert(tableName, image.toJson());
    }
    return result;
  }

  Future delete(ImageProductModel imageProduct) async {
    final db = await databaseHandler.initializeDB();
    db.delete(tableName, where: 'id = ?', whereArgs: [imageProduct.id]);
  }
}
