
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:study_app_client/Topics/biology.dart';
import 'package:study_app_client/Topics/chemistry.dart';
import 'package:study_app_client/Topics/physics.dart';
import 'package:study_app_client/Topics/astronomy.dart';
import 'package:study_app_client/Topics/earth_science.dart';


class Science extends StatefulWidget {
  final String title = 'Science';

  const Science({super.key});

  @override
  _ScienceState createState() => _ScienceState();
}
class _ScienceState extends State<Science> {
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
                'Science',
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
                  Navigator.pushNamed(context, '/biology');
                },
                child: const Text(
                  'Biology',
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
                  Navigator.pushNamed(context, '/chemistry');
                },
                child: const Text(
                  'Chemistry',
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
                  Navigator.pushNamed(context, '/physics');
                },
                child: const Text(
                  'Physics',
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
                  Navigator.pushNamed(context, '/astronomy');
                },
                child: const Text(
                  'Astronomy',
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
                  Navigator.pushNamed(context, '/earth_science');
                },
                child: const Text(
                  'Earth Science',
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

