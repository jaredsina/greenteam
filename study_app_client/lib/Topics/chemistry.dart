
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;


class Chemistry extends StatefulWidget {
  final String title = 'Chemistry';

  const Chemistry({super.key});

  @override
  _ChemistryState createState() => _ChemistryState();
}
class _ChemistryState extends State<Chemistry> {
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
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Text(
            'Chemistry',
            style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 40),
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Type Here:',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  ),
  floatingActionButton: SizedBox(
    width: 160,
    height: 60,
    child: FloatingActionButton(
      onPressed: () {},
      child: const Text(
        'Add Image+',
        style: TextStyle(fontSize: 20) ,
      )
    )
  ),
);
}
}