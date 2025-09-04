import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/help_request.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("app.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE help_requests (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        category TEXT NOT NULL,
        details TEXT NOT NULL,
        offered INTEGER NOT NULL DEFAULT 0
      )
    ''');
  }

  // Insert a new request
  Future<int> insertRequest(HelpRequest request) async {
    final db = await instance.database;
    return await db.insert("help_requests", request.toMap());
  }

  // Get all requests
  Future<List<HelpRequest>> getRequests() async {
    final db = await instance.database;
    final result = await db.query("help_requests");
    return result.map((json) => HelpRequest.fromMap(json)).toList();
  }

  // Mark as offered
  Future<int> offerHelp(int id) async {
    final db = await instance.database;
    return await db.update(
      "help_requests",
      {"offered": 1},
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // Get only offered requests
  Future<List<HelpRequest>> getMyOffers() async {
    final db = await instance.database;
    final result = await db.query("help_requests", where: "offered = ?", whereArgs: [1]);
    return result.map((json) => HelpRequest.fromMap(json)).toList();
  }
}
