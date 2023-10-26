import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/tasks_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {

    var taskData = Provider.of<TaskData>(context);

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add, color: Colors.white,),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => AddTaskScreen()
          );
        }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(
                      Icons.list,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    )),
                const SizedBox(height: 20),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  // 11 add length of tasks
                  // '${tasks.length} Tasks',
                  '${taskData.tasksCount} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: TasksList(), //  4 pass tasks here
            ),
          )
        ],
      ),
    );
  }
}

// AddTaskScreen(
// (newTaskTitle) {
// print('newTaskTitle2: $newTaskTitle');
// // setState(() {
// //   taskData.tasks.add(Task(name: newTaskTitle));
// // });
// Navigator.pop(context);
// }
// )

