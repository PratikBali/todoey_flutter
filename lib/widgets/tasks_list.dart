import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/new_tasks_tile.dart';
import '../model/tasks_data.dart';

class TasksList extends StatelessWidget {
  // late List<Task> tasks;
  // TasksList(this.tasks);

  @override
  Widget build(BuildContext context) {

    // var taskData = Provider.of<TaskData>(context);

    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  taskData.updateTask(task);
                },
                longPressCallback: () {
                  taskData.removeTask(index);
                },
              );
          },
          itemCount: taskData.tasksCount,
        );
      },
    );
  }
}

// 2 add widget.tasks for local state
// hard coded data
//(
//       children: [
//         TaskTile(taskTitle: tasks[0].name, isChecked: tasks[0].isDone,),
//         TaskTile(taskTitle: tasks[1].name, isChecked: tasks[1].isDone,),
//         TaskTile(taskTitle: tasks[2].name, isChecked: tasks[2].isDone,),
//       ],
//     )
