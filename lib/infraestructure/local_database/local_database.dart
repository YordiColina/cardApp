import 'package:card_app/domain/models/item_data/repository/item_repository.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../domain/models/item_data/item.dart';
import '../errors/database_exception.dart';
import '../helpers/local_database_helper.dart';

class LocalDatabase implements ItemRepository {
  static final LocalDatabase _instance = LocalDatabase._internal();

  factory LocalDatabase() => _instance;

  static Database? _database;
  final Logger _logger = Logger();

  LocalDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      final path = join(dbPath, 'items.db');

      return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreateDatabase,
      );
    } catch (e) {
      _logger.e('Database initialization failed: $e');
      throw LocalDatabaseException('Failed to initialize database: $e');
    }
  }

  Future<void> _onCreateDatabase(Database db, int version) async {
    try {
      await LocalDatabaseHelper.createTables(db);
      _logger.i('Database tables created successfully.');
    } catch (e) {
      _logger.e('Failed to create database tables: $e');
      throw LocalDatabaseException('Failed to create database tables: $e');
    }
  }

  @override
  Future<List<Item>> getItems() async {
    try {
      final db = await database;
      final result = await db.query('items');
      _logger.i('Fetched ${result.length} items from the database.');
      return result.map((map) => Item.fromMap(map)).toList();
    } catch (e) {
      _logger.e('Failed to fetch items: $e');
      throw LocalDatabaseException('Failed to fetch items: $e');
    }
  }

  @override
  Future<int> addItem(Item item) async {
    if (!_validateItem(item)) {
      _logger.w('Invalid item data: $item');
      throw ArgumentError('Invalid item data');
    }

    try {
      final db = await database;
      final result = await db.insert('items', item.toMap());
      _logger.i('Item added: ${item.id}');
      return result;
    } catch (e) {
      _logger.e('Failed to add item: $e');
      throw LocalDatabaseException('Failed to add item: $e');
    }
  }

  @override
  Future<int> updateItem(Item item) async {
    if (!_validateItem(item)) {
      _logger.w('Invalid item data: $item');
      throw ArgumentError('Invalid item data');
    }

    try {
      final db = await database;
      final result = await db.update(
        'items',
        item.toMap(),
        where: 'id = ?',
        whereArgs: [item.id],
      );
      _logger.i('Item updated: ${item.id}');
      return result;
    } catch (e) {
      _logger.e('Failed to update item: $e');
      throw LocalDatabaseException('Failed to update item: $e');
    }
  }

  @override
  Future<int> deleteItem(String id) async {
    try {
      final db = await database;
      final result = await db.delete(
        'items',
        where: 'id = ?',
        whereArgs: [id],
      );
      _logger.i('Item deleted: $id');
      return result;
    } catch (e) {
      _logger.e('Failed to delete item: $e');
      throw LocalDatabaseException('Failed to delete item: $e');
    }
  }

  bool _validateItem(Item item) {
    if (item.name.isEmpty) {
      _logger.w('El campo "name" no puede estar vacío.');
      return false;
    }
    if (item.price < 0) {
      _logger.w('El precio no puede ser negativo.');
      return false;
    }
    if (item.stock < 0) {
      _logger.w('El stock no puede ser negativo.');
      return false;
    }
    return true;
  }
}

