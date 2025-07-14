
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;


class PreCalculus extends StatefulWidget {
  final String title = 'Pre Calculus';

  const PreCalculus({super.key});

  @override
  _PreCalculusState createState() => _PreCalculusState();
}
class _PreCalculusState extends State<PreCalculus> {
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
            'Pre Calculus',
            style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 40),
          quill.QuillSimpleToolbar(
            controller: controller
          ),
          Container(
            decoration: const BoxDecoration(
            border: Border(
             top: BorderSide(color: Color(0xFF000000)),
             bottom: BorderSide(color: Colors.black),
             left: BorderSide(color: Colors.black),
             right: BorderSide(color: Colors.black)
             ),
            ),
          child: SizedBox(
            height: 200,
            child:quill.QuillEditor(
            focusNode: FocusNode(), 
            scrollController: ScrollController(), 
            controller: controller,
            config: quill.QuillEditorConfig(
              placeholder: 'write words',
    
            ), 
            ),
          ),
          ),
      ]
          )
    ),
  // ignore: dead_code
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
  )
    );
}
}