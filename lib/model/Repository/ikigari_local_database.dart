import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class IkigariLocalDatabase {

  Future<Database> getDatabase() async {
    return openDatabase(
      await createPath(),
      version: 1,
      onCreate: (Database db, int version) async {
        await createTables(db, version);
      },
    );
  }

  Future<String> createPath() async {
    String start = await getDatabasesPath();
    String end = "ikigari.db";
    return p.join(start, end);
  }

  Future<void> createTables(Database db, int version) async {
    await db.execute('''
        CREATE TABLE FOODCONSUMED(
        id INTEGER PRIMARY KEY NOT NULL,
        foodId TEXT NOT NULL,
        foodName TEXT NOT NULL,
        foodCaloriesPer100g REAL NOT NULL,
        dateAndHour TEXT NOT NULL,
        grams REAL NOT NULL
        );
      ''');
  }
}
