
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:study_app_client/Topics/algebra.dart';
import 'package:study_app_client/Topics/calculus.dart';
import 'package:study_app_client/Topics/geometry.dart';
import 'package:study_app_client/Topics/pre_calculus.dart';
import 'package:study_app_client/Topics/statistics.dart';

class Math extends StatefulWidget {
  final String title = 'Math';

  const Math({super.key});

  @override
  _MathState createState() => _MathState();
}
class _MathState extends State<Math> {
  @override
  Widget build(BuildContext context) {
    final quill.QuillController controller = quill.QuillController.basic();
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
                'Math',
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
                  'Topics:',
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
                  Navigator.pushNamed(context, '/algebra');
                },
                child: const Text(
                  'Algebra',
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
                  Navigator.pushNamed(context, '/geometry');
                },
                child: const Text(
                  'Geometry',
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
                  Navigator.pushNamed(context, '/calculus');
                },
                child: const Text(
                  'Calculus',
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
                  Navigator.pushNamed(context, '/pre_calculus');
                },
                child: const Text(
                  'Pre Calculus',
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
                  Navigator.pushNamed(context, '/statistics');
                },
                child: const Text(
                  'Statistics',
                  style: TextStyle(fontSize: 20),
                ),
                ),
              ),
            ],
           ),
          ),
       )
    );
   
  }
}
Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Topic Title'),
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

