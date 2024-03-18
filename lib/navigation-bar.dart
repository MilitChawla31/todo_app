import 'package:flutter/material.dart';
import 'package:todo_app/add-task.dart';
import 'package:todo_app/main-screen.dart';
import 'package:todo_app/main.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.indigoAccent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_task_rounded),
          label: 'Add Tasks',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.logout),
          label: 'Logout',
        ),
      ],
      onTap: (int index) {
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()),
          );
        } 
        else if (index == 1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AddTaskScreen(addTaskCallback: (String title, String priority, String completeBy) {  },)),
          );
        }

        else if (index == 2) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }

      },
    );
  }
}
