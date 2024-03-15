import 'package:todo_app/main-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
          titleTextStyle: TextStyle(
              fontSize: 24,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w500),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(
                Icons.task_alt_rounded,
              ),
            )
          ],
        ),
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
                    width: 200,
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(labelText: 'Enter your name'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    decoration:
                        InputDecoration(labelText: 'Enter your Password'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton(
                    child: const Text('Log In'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainScreen()),
                      );
                    },
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
