import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/new_tasks_tile.dart';

import '../model/tasks_model.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  List<Task> tasks = [
    Task(name: 'buy helicopter'),
    Task(name: 'buy casino'),
    Task(name: 'buy amdocs'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: tasks[index].name,
            isChecked: tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}

//(
//       children: [
//         TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone,),
//         TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone,),
//         TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone,),
//       ],
//     )
