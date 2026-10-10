import 'package:ikigari/model/Repository/ikigari_local_database.dart';
import 'package:ikigari/model/food_consumed_data.dart';
import 'package:sqflite/sqflite.dart';

class FoodConsumedRepository {
  final IkigariLocalDatabase _localDb = IkigariLocalDatabase();
  static const String _nameTable = "FOODCONSUMED";

  Future<int> saveFoodConsumed(FoodConsumedData foodConsumed) async {
    final Database db = await _localDb.getDatabase();
    return db.insert(_nameTable, foodConsumed.toMap());
  }

  Future<List<FoodConsumedData>> selectFoodConsumed() async {
    final Database db = await _localDb.getDatabase();
    final List<Map<String, dynamic>> listFoodConsumed = await db.query(
      _nameTable,
      where: "date(dateAndHour) = date('now', 'localtime');",
    );
    return listFoodConsumed.map((food) => FoodConsumedData.fromMap(food)).toList();
  }
}
