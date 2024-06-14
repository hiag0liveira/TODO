import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
