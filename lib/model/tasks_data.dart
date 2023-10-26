import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'tasks_model.dart';

class TaskData extends  ChangeNotifier {

  final List<Task> _tasks = [
    Task(name: 'buy helicopter'),
    Task(name: 'buy casino'),
    Task(name: 'buy amdocs'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount {
    return _tasks.length;
  }

  setTask(taskTitle) {
    _tasks.add(Task(name: taskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}