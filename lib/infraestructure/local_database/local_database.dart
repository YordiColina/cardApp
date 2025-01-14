import 'package:card_app/domain/models/item_data/repository/item_repository.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/models/item_data/item.dart';

class LocalDatabase implements ItemRepository {
  static final LocalDatabase _instance = LocalDatabase._internal();
  factory LocalDatabase() => _instance;

  static Database? _database;

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'items.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE items (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            price REAL,
            color TEXT,
            weight REAL
          )
        ''');
      },
    );
  }
  @override
  Future<List<Item>> getItems() async {
    final db = await database;
    final result = await db.query('items');
    return result.map((map) => Item.fromMap(map)).toList();
  }
  @override
  Future<int> addItem(Item item) async {
    final db = await database;
    return await db.insert('items', item.toMap());
  }
  @override
  Future<int> updateItem(Item item) async {
    final db = await database;
    return await db.update(
      'items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }
 @override
  Future<int> deleteItem(String id) async {
    final db = await database;
    return await db.delete(
      'items',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

}
