import 'dart:core';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  late final String taskTitle;
  final Function(bool?) checkboxCallback;

  TaskTile({required this.isChecked, required this.taskTitle, required this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none),),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          // onChanged: toggleCheckboxState,
          onChanged: checkboxCallback
      ),
    );
  }
}

