import 'package:flutter/material.dart';
import 'package:todo_app/menu-drawer.dart';
import 'package:todo_app/navigation-bar.dart';

class AddTaskScreen extends StatelessWidget {
  final Function(String title, String priority, String completeBy)
      addTaskCallback;

  AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priorityController = TextEditingController();
  final TextEditingController _completeByController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO'),
        backgroundColor: Colors.indigoAccent,
        ),
      drawer: MenuDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _priorityController,
              decoration: const InputDecoration(labelText: 'Priority'),
            ),
            TextField(
              controller: _completeByController,
              decoration: const InputDecoration(labelText: 'Complete By'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                String priority = _priorityController.text;
                String completeBy = _completeByController.text;
                addTaskCallback(title, priority, completeBy);
                Navigator.pop(context);
              },
              child: const Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
