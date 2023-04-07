import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/add_task_bottom_sheet.dart';
import 'package:todoey/constants.dart';

import '../models/tasks_list.dart';
import '../components/todo_list_tile_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      floatingActionButton: SizedBox(
        height: 80,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddTaskBottomSheet(),
                    )));
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
                    "${Provider.of<TasksList>(context).tasksCount} Tasks",
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
              child: Consumer<TasksList>(
                builder: (context, tasksListData, child) {
                  return ListView.builder(
                    itemCount: tasksListData.tasksCount,
                    itemBuilder: (BuildContext context, int index) {
                      return ToDoListTileItem(
                        taskName: tasksListData.getTaskName(index),
                        isChecked: tasksListData.getTaskState(index),
                        checkBoxCallback: () =>
                            tasksListData.toggleTaskState(index),
                        isLongPressedCallback: () =>
                            tasksListData.deleteTask(index),
                      );
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
