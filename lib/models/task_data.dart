import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: '10 dakika kitap oku'),
    Task(name: 'Ders çalış'),
    Task(name: 'Günde 2 defa dişini fırçala'),
    Task(name: 'İngilizce çalış'),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  //To use notifyListeners and make it reactive use another method to add a task
  void addTask(String newTask) {
    final Task task = Task(name: newTask);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
