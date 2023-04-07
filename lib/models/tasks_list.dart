import 'package:flutter/material.dart';
import 'task.dart';

class TasksList extends ChangeNotifier {
  List<Task> tasks = [Task(name: 'Buy Milk')];

  void addTask(String taskName) {
    tasks.add(Task(name: taskName));
    notifyListeners();
  }

  void toggleTaskState(int index) {
    tasks[index].toggleCheck();
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }

  int get tasksCount => tasks.length;

  String getTaskName(int index) => tasks[index].name;
  bool getTaskState(int index) => tasks[index].isDone;
}
