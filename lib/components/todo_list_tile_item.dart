import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class ToDoListTileItem extends StatelessWidget {
  const ToDoListTileItem({
    Key? key,
    required this.taskName,
    required this.isChecked,
    required this.checkBoxCallback,
    required this.isLongPressedCallback,
  }) : super(key: key);

  final String taskName;
  final bool isChecked;
  final VoidCallback checkBoxCallback;
  final VoidCallback isLongPressedCallback;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return kBackgroundColor;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
        onLongPress: () => isLongPressedCallback(),
        leading: Text(
          taskName,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 23,
            fontWeight: FontWeight.w400,
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) => checkBoxCallback(),
          fillColor: MaterialStateProperty.resolveWith(getColor),
          checkColor: Colors.white,
        ),
      ),
    );
  }
}
