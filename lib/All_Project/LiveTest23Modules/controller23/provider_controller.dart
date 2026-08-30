

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../model23/model23.dart';

class TaskProvider23 extends ChangeNotifier {
  List<Todo23> _todos23 = [];
  final _uuid = const Uuid();

  List<Todo23> get todos => _todos23;

  int get completedTodos => _todos23.where((t) => t.isCompleted).length;

  int get totalTodos => _todos23.length;

  double get progress => totalTodos > 0 ? completedTodos / totalTodos : 0.0;

  TaskProvider23() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> decoded = jsonDecode(todosString);
      _todos23 = decoded.map((item) => Todo23.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_todos23.map((t) => t.toJson()).toList());
    await prefs.setString('todos', encoded);
  }

  void addTodo(String title, String description) {
    final newTodo = Todo23(
      id: _uuid.v4(),
      title: title,
      description: description,
    );

    _todos23.add(newTodo);
    _saveTodos();
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos23.indexWhere((t) => t.id == id);
    if (todoIndex != -1) {
      _todos23[todoIndex].isCompleted = !_todos23[todoIndex].isCompleted;
      _saveTodos();
      notifyListeners();
    }
  }

  void removeTodo(String id) {
    _todos23.removeWhere((t) => t.id == id);
    _saveTodos();
    notifyListeners();
  }
}
