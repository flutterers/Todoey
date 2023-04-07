import 'package:flutter/material.dart';
import 'package:todoey/components/add_task_bottom_sheet.dart';
import 'package:todoey/constants.dart';

import '../components/todo_list_tile_item.dart';
import '../models/task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  dynamic addedTask = "";
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: SizedBox(
        height: 80,
        width: 60,
        child: FloatingActionButton(
          onPressed: () async {
            addedTask = await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskBottomSheet(),
                    )));
            setState(() {
              tasks.add(Task(name: addedTask));
            });
          },
          backgroundColor: kBackgroundColor,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 35,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.list),
                    color: kBackgroundColor,
                    iconSize: 40,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Todoey',
                  style: kMainTitleStyle,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${tasks.length} Tasks",
                    style: kSubTitleStyle,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ToDoListTileItem(
                    taskName: tasks[index].name,
                    isChecked: tasks[index].isDone,
                    checkBoxCallback: () {
                      setState(() {
                        tasks[index].toggleCheck();
                      });
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
