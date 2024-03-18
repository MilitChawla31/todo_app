// import 'package:first_app/basic-navigation.dart';
import 'package:todo_app/add-task.dart';
import 'package:todo_app/main-screen.dart';
import 'package:todo_app/main.dart';
// import 'package:first_app/register-screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // DrawerHeader(
          //     decoration: BoxDecoration(color: Colors.indigoAccent),
          //     child: Text(
          //   "Title",
          //   style: TextStyle(fontSize: 30),
          // )),
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.indigoAccent),
            accountName: Text(
              'Milit Chawla',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('militchawla@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'All Tasks',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.add_task_rounded),
            title: Text(
              'Add Task',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddTaskScreen(addTaskCallback: (String title, String priority, String completeBy) {  },)));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Log Out',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
             Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyApp()));
            },
            
          ),
        ],
      ),
    );
  }
}