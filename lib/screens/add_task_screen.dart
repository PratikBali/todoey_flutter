import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/model/tasks_data.dart';

class AddTaskScreen extends StatelessWidget {
  // 9 addTaskCallback function
  // final Function addTaskCallback;
  // 10 initialize constructor for addTaskCallback
  // AddTaskScreen(this.addTaskCallback);

  final messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 5 add newTaskTitle
    String newTaskTitle = '';
    return Consumer<TaskData>(
      builder: (context, taskData, Widget? child) {
        return  Container(
          // height: 400,
          color: const Color(0xff757575),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontSize: 30
                    ),
                  ),
                  TextField(
                      autofocus: true,
                      textAlign: TextAlign.center,
                      controller: messageTextController,
                      decoration: const InputDecoration(
                          hintText: 'Enter your task name'
                      ),
                      // 6 add method to set newTaskTitle
                      onChanged: (value) {
                        newTaskTitle = value;
                      }
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                    onPressed: () => {
                      messageTextController.clear(),
                      taskData?.setTask(newTaskTitle),
                      Navigator.pop(context)
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
// onPressed: () => {
// messageTextController.clear(),
// addTaskCallback(newTaskTitle),
// 8 addTaskCallback to send newTaskTitle
//   print('newTaskTitle: $newTaskTitle')
// },
