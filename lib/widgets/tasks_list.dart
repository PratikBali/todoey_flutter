import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/new_tasks_tile.dart';

import '../model/tasks_model.dart';

class TasksList extends StatefulWidget {
  // 1 construct here for List<Task> tasks;
  late List<Task> tasks;
  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name, // 2 add widget.tasks
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
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
