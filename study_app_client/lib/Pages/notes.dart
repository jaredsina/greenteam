// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:study_app_client/Pages/Catagorys/math.dart';
import 'package:study_app_client/Pages/Catagorys/spanish.dart';
import 'Catagorys/literature.dart';
import 'Catagorys/history.dart';
import 'Catagorys/science.dart';


class Notes extends StatefulWidget {
  final String title = 'Notes';

  const Notes({super.key});

  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
    final quill.QuillController controller = quill.QuillController.basic();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Notes',
                style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(150, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                  ),
                  onPressed: () {
                    _dialogBuilder(context);

                  },
                  child: const Text(
                    'Create+',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                  'Courses:',
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.normal, color: Colors.black),
                ),
           const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/science');
                },
                child: const Text(
                  'Science',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            const SizedBox(height: 10),
              SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
                onPressed: () {
                  Navigator.pushNamed(context,'/literature');
                },
                child: const Text(
                  'Literature',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            const SizedBox(height: 10),
              SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
                onPressed: () {
                 Navigator.pushNamed(context,'/history');
                },
                child: const Text(
                  'History',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            const SizedBox(height: 10),
              SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/math');
                },
                child: const Text(
                  'Math',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            const SizedBox(height: 10),
              SizedBox(
              width: double.infinity,
              height: 60,
              child: FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.centerLeft,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/spanish');
                },
                child: const Text(
                  'Spanish',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            ],
           ),
          ),
       )
    );
    return MaterialApp(
      routes: { 
        '/literature': (context) => const Literature(),
        '/history': (context) => const History(),
        '/math': (context) => const Math(),
        '/spanish': (context) => const Spanish(),
        '/science': (context) => const Science()
      },
  );
   
  }
}

Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Course Title'),
          actions: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type Here'
              ),
            ),
           Row(
            children: [
            const SizedBox(height: 10,),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(textStyle: Theme.of(context).textTheme.labelLarge),
              child: const Text('Enter'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ]
          )
          ],
        );
      },
    );
  }

