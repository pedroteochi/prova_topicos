import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.internal();
  Database? _database;

  factory DatabaseHelper() {
    return instance;
  }

  DatabaseHelper.internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'user_database.db'),
      version: 2, // Incrementa a versão do banco de dados
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE users('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'nome TEXT, '
          'idade INTEGER, '
          'sexo TEXT, '
          'email TEXT, '
          'password TEXT'
          ')',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE users ADD COLUMN nome TEXT');
          await db.execute('ALTER TABLE users ADD COLUMN idade INTEGER');
          await db.execute('ALTER TABLE users ADD COLUMN sexo TEXT');
        }
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db!.insert(
      'users',
      user,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Map<String, dynamic>?> getUser(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> users =
        await db!.query('users', where: 'email = ?', whereArgs: [email]);

    if (users.isNotEmpty) {
      return users.first;
    }

    return null;
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final db = await database;
    return await db!.query('users');
  }
}
