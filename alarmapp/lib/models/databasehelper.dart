import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'alarmsDataBase.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE alarmsDataBase (
        String INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database;
    return await db.insert('alarmsDataBase', row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    final db = await database;
    return await db.query('alarmsDataBase');
  }

  Future<int> update(Map<String, dynamic> row) async {
    final db = await database;
    final id = row['id'];
    return await db
        .update('alarmsDataBase', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete('alarmsDataBase', where: 'id = ?', whereArgs: [id]);
  }
}
