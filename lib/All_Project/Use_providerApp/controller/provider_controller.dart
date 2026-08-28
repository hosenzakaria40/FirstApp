import 'dart:convert';

import 'package:fast_app/All_Project/Use_providerApp/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class TaskProvider extends ChangeNotifier {
  List<Todo> _todos = [];
  final _uuid = const Uuid();

  List<Todo> get todos => _todos;

  int get completedTodos => _todos.where((t) => t.isCompleted).length;

  int get totalTodos => _todos.length;

  double get progress => totalTodos > 0 ? completedTodos / totalTodos : 0.0;

  TaskProvider() {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todosString = prefs.getString('todos');
    if (todosString != null) {
      final List<dynamic> decoded = jsonDecode(todosString);
      _todos = decoded.map((item) => Todo.fromJson(item)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_todos.map((t) => t.toJson()).toList());
    await prefs.setString('todos', encoded);
  }

  void addTodo(String title, String description) {
    final newTodo = Todo(
      id: _uuid.v4(),
      title: title,
      description: description,
    );

    _todos.add(newTodo);
    _saveTodos();
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos.indexWhere((t) => t.id == id);
    if (todoIndex != -1) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      _saveTodos();
      notifyListeners();
    }
  }

  void removeTodo(String id) {
    _todos.removeWhere((t) => t.id == id);
    _saveTodos();
    notifyListeners();
  }
}
