import 'package:flutter/material.dart';
import 'package:todoey/models/task.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:provider/provider.dart';

import 'models/tasks_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<TasksList>(
      create: (context) => TasksList(),
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
