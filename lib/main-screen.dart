import 'package:flutter/material.dart';
import 'package:todo_app/menu-drawer.dart';

class MainScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
          backgroundColor: Colors.indigoAccent,
          titleTextStyle: TextStyle(fontSize: 24, color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.task_alt_rounded, ),
            )
          ],
        ),
        drawer: MenuDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.indigoAccent,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task_rounded), label: 'Add Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded), label: 'Profile'),
        ]),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  Image.network(
                    'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}