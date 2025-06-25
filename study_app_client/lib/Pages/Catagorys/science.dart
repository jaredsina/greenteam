
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;


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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
                onPressed: () {},
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
