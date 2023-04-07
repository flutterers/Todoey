import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/tasks_list.dart';
import 'package:todoey/constants.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String typedTask = "";

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Add Task',
                  style: TextStyle(
                      color: kBackgroundColor,
                      fontSize: 28,
                      fontFamily: 'sans-serif',
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  typedTask = value;
                },
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: kBackgroundColor,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 3,
                          color: kBackgroundColor,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                ),
                cursorColor: kBackgroundColor,
                enabled: true,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Provider.of<TasksList>(context, listen: false)
                        .addTask(typedTask);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kBackgroundColor),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Add',
                      style: kSubTitleStyle.copyWith(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
