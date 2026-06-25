import 'package:path/path.dart' as p;

import 'package:sqflite/sqflite.dart';

import '../Model/TaskModel.dart';

class TaskDbHelper {
  static Database? _db;

  static Future<Database> getDb() async {
    if (_db != null) return _db!;
    _db = await openDatabase(
      p.join(await getDatabasesPath(), 'task.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, isDone INTEGER)',
        );
      },
      version: 2,
    );
    return _db!;
  }

  static Future<void> insertTask(TaskModel task) async {
    final db = await getDb();
    await db.insert(
      'tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<TaskModel>> getAllTasks() async {
    final List<Map<String, dynamic>> maps = await (await getDb()).query(
      'tasks',
    );
    return List.generate(maps.length, (i) {
      return TaskModel.fromMap(maps[i]);
    });
  }

  static Future<void> updateTask(TaskModel task) async {
    final db = await getDb();
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  static Future<void> deleteTask(int id) async {
    final db = await getDb();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
