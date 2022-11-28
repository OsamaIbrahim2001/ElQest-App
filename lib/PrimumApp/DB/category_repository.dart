import '../Models/category_model.dart';
import 'database_handler.dart';

class CategoryRepository {
  String tableName = 'category';
  DatabaseHandler databaseHandler = DatabaseHandler();

  Future insert(CategoryModel category) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(tableName, category.toJson());
    return result;
  }

  Future getCategories() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(tableName);
    return queryResults.map((e) => CategoryModel.fromJson(e)).toList();
  }
}