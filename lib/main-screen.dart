import 'package:flutter/material.dart';
import 'package:todo_app/menu-drawer.dart';
import 'package:todo_app/navigation-bar.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: WatchlistScreen(),
    );
  }
}

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        backgroundColor: Colors.indigoAccent,
      ),
      drawer: MenuDrawer(),
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: ListView(
        children: const [
          WatchlistItemCompact(
            title: 'Complete Project',
            priority: 'Urgent',
            completeBy: '19-03-2024',
          ),
          WatchlistItemCompact(
            title: 'Pre Placement Test',
            priority: 'Important',
            completeBy: '28-03-2024',
          ),
          WatchlistItemCompact(
            title: 'Apply for Internship',
            priority: 'Not Important',
            completeBy: '30-04-2024',
          ),
        ]
            .map((widget) => Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Card(
                    elevation: 4,
                    child: widget,
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class WatchlistItemCompact extends StatelessWidget {
  final String title;
  final String priority;
  final String completeBy;

  const WatchlistItemCompact({
    Key? key,
    required this.title,
    required this.priority,
    required this.completeBy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('Priority: $priority\nComplete By: $completeBy'),
      onTap: () {
        //Handle tapping on the task item (if needed)
      },
    );
  }
}
