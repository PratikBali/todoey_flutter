import 'dart:core';

import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void toggleCheckBox(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'This is a task',
        style: TextStyle(
            decoration:
                isChecked ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: TaskCheckBox(
          checkBoxState: isChecked, toggleCheckboxState: toggleCheckBox),
    );
  }
}

class TaskCheckBox extends StatelessWidget {
  TaskCheckBox({required this.checkBoxState, required this.toggleCheckboxState});

  final bool checkBoxState;
  final Function toggleCheckboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkBoxState,
      // onChanged: toggleCheckboxState,
      onChanged: (value) {
        toggleCheckboxState(value);
      },
    );
  }
}
