import 'package:sqflite/sqflite.dart';

class LocalDatabaseHelper {
  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE items (
        id TEXT PRIMARY KEY,
        name TEXT,
        description TEXT,
        price REAL,
        color TEXT,
        weight REAL,
        detailDescription TEXT,
        marca TEXT,
        modelo TEXT,
        stock INTEGER
      )
    ''');
  }
}