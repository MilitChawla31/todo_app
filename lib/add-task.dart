// import 'package:flutter/material.dart';
// import 'package:todo_app/menu-drawer.dart';
// import 'package:todo_app/navigation-bar.dart';

// class AddTaskScreen extends StatelessWidget {
//   final Function(String title, String priority, String completeBy)
//       addTaskCallback;

//   AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

//   final TextEditingController _titleController = TextEditingController();
//   final TextEditingController _priorityController = TextEditingController();
//   final TextEditingController _completeByController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('TODO'),
//         backgroundColor: Colors.indigoAccent,
//         ),
//       drawer: MenuDrawer(),
//       bottomNavigationBar: CustomBottomNavigationBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: _priorityController,
//               decoration: const InputDecoration(labelText: 'Priority'),
//             ),
//             TextField(
//               controller: _completeByController,
//               decoration: const InputDecoration(labelText: 'Complete By'),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 String title = _titleController.text;
//                 String priority = _priorityController.text;
//                 String completeBy = _completeByController.text;
//                 addTaskCallback(title, priority, completeBy);
//                 Navigator.pop(context);
//               },
//               child: const Text('Add Task'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
 

// import 'package:flutter/material.dart';
// import 'package:todo_app/menu-drawer.dart';
// import 'package:todo_app/navigation-bar.dart';

// class AddTaskScreen extends StatelessWidget {
//   final Function(String title, String priority, String completeBy)
//       addTaskCallback;

//   AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

//   final TextEditingController _titleController = TextEditingController();
//   final ValueNotifier<String> _selectedPriority = ValueNotifier<String>('High');
//   DateTime? _selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('TODO'),
//         backgroundColor: Colors.indigoAccent,
//       ),
//       drawer: MenuDrawer(),
//       bottomNavigationBar: CustomBottomNavigationBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: _titleController,
//               decoration: const InputDecoration(labelText: 'Title'),
//             ),
//             SizedBox(height: 20),
//             DropdownButtonFormField<String>(
//               value: _selectedPriority.value,
//               decoration: const InputDecoration(labelText: 'Priority'),
//               items: ['High', 'Medium', 'Low']
//                   .map((priority) => DropdownMenuItem(
//                         child: Text(priority),
//                         value: priority,
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 _selectedPriority.value = value!;
//               },
//             ),
//             SizedBox(height: 20),
//             TextFormField(
//               readOnly: true,
//               decoration: InputDecoration(
//                 labelText: 'Complete By',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.calendar_today),
//                   onPressed: () async {
//                     final selectedDate = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );
//                     if (selectedDate != null) {
//                       _selectedDate = selectedDate;
//                     }
//                   },
//                 ),
//               ),
//               onTap: () {}, // to prevent keyboard from showing up
//               controller: TextEditingController(
//                 text: _selectedDate != null
//                     ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
//                     : '',
//               ),
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 String title = _titleController.text;
//                 addTaskCallback(title, _selectedPriority.value,
//                     _selectedDate != null ? _selectedDate.toString() : '');
//                 Navigator.pop(context);
//               },
//               child: const Text('Add Task'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:todo_app/menu-drawer.dart';
import 'package:todo_app/navigation-bar.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(String title, String priority, String completeBy) addTaskCallback;

  const AddTaskScreen({Key? key, required this.addTaskCallback}) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final ValueNotifier<String> _selectedPriority = ValueNotifier<String>('High');
  DateTime? _selectedDate;

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
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedPriority.value,
              decoration: const InputDecoration(labelText: 'Priority'),
              items: ['High', 'Medium', 'Low']
                  .map((priority) => DropdownMenuItem(
                        child: Text(priority),
                        value: priority,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedPriority.value = value!;
                });
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Complete By',
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _selectedDate = selectedDate;
                      });
                    }
                  },
                ),
              ),
              onTap: () {}, // to prevent keyboard from showing up
              controller: TextEditingController(
                text: _selectedDate != null
                    ? '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}'
                    : '',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String title = _titleController.text;
                widget.addTaskCallback(
                  title,
                  _selectedPriority.value,
                  _selectedDate != null ? _selectedDate.toString() : '',
                );
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
        
