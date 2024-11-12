import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  List<Task> getTasksByCategory(String category) {
    return _tasks.where((task) => task.category == category).toList();
  }

  void addTask(String text) {
    _tasks.add(Task(
      id: DateTime.now().millisecondsSinceEpoch,
      text: text,
      category: 'notStarted',
    ));
    notifyListeners();
  }

  void updateTask(int id, String text) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(text: text);
      notifyListeners();
    }
  }

  void deleteTask(int id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void moveTask(int id, String newCategory) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = _tasks[taskIndex].copyWith(category: newCategory);
      notifyListeners();
    }
  }
}