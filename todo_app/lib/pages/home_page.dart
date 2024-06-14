import 'package:flutter/material.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  List toDoList = [
    {'task': 'Task 1', 'completed': false},
    {'task': 'Task 2', 'completed': false},
    {'task': 'Task 3', 'completed': false},
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index]['completed'] = !toDoList[index]['completed'];
    });
  }

  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add({'task': _controller.text, 'completed': false});
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('ToDo'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index]['task'],
            taskCompleted: toDoList[index]['completed'],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      ),
    );
  }
}
