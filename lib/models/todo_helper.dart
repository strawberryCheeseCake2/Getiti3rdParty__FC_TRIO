import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './todo.dart';

class ToDoHelper {
  // final String tableName =

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
    // Get a reference to the database.
    final db = await _openDb();
    print(db);
    todo.id = await db.insert(
      'todos',
      todo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ToDo>> getToDos() async {
    // Get a reference to the database.
    final db = await _openDb();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('todos');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return ToDo(
        id: maps[i]['id'],
        title: maps[i]['title']
      );
    });
  }

  Future<void> updateToDo(ToDo todo) async {
    // Get a reference to the database.
    final db = await _openDb();

    // Update the given Dog.
    await db.update(
      'todos',
      todo.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ${todo.id}',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [todo.id],
    );
  }

  Future<void> deleteToDo(int id) async {
    // Get a reference to the database.
    final db = await _openDb();

    // Remove the Dog from the database.
    await db.delete(
      'todos',
      // Use a `where` clause to delete a specific dog.
      where: 'id = $id',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS todos (
        id INTEGER PRIMARY KEY,
        title TEXT
      )
    ''');
  }
}