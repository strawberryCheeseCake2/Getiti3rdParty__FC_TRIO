import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './todo.dart';

class ToDoHelper {
  final String tableName = 'todos';

  Future _openDb() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'todo.db');

    final db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  Future<void> insertToDo(ToDo todo) async {
    final db = await _openDb();
    print(todo);
    todo.id = await db.insert(
      tableName,
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ToDo>> getToDos() async {
    final db = await _openDb();

    final List<Map<String, dynamic>> maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return ToDo(
        id: maps[i]['id'],
        title: maps[i]['title']
      );
    });
  }

  Future<ToDo?> getToDoById(int id) async {
    final db = await _openDb();

    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isEmpty) {
      return null;
    }
    print(maps);
    return ToDo(
      id: maps[0]['id'],
      title: maps[0]['title'],
      content: maps[0]['content'],
    );
  }

  Future<void> updateToDo(ToDo todo) async {
    final db = await _openDb();

    await db.update(
      tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteToDo(int id) async {
    final db = await _openDb();

    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS todos (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        content TEXT
      )
    ''');
  }
}