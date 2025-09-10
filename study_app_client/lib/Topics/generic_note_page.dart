import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> createPost(BuildContext context, String category, String notes) async {
  final url = Uri.parse('http://127.0.0.1:4000/notes/post');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'note': notes,
      'user_id': 1, // placeholder
      'category': category,
    }),
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Note created and saved.')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Failed to save.')),
    );
  }
}

class GenericNotePage extends StatefulWidget {
  final String title;

  const GenericNotePage({super.key, required this.title});

  @override
  _GenericNotePageState createState() => _GenericNotePageState();
}

class _GenericNotePageState extends State<GenericNotePage> {
  late quill.QuillController controller;

  @override
  void initState() {
    super.initState();
    controller = quill.QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
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
                widget.title,
                style: const TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 40),
            quill.QuillSimpleToolbar(controller: controller),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                ),
              ),
              child: SizedBox(
                height: 200,
                child: quill.QuillEditor(
                  focusNode: FocusNode(),
                  scrollController: ScrollController(),
                  controller: controller,
                  config: quill.QuillEditorConfig(
                    placeholder: 'write words',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20, height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.tonal(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 60),
                    alignment: Alignment.bottomRight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                  ),
                  onPressed: () {
                    final content = controller.document.toDelta();
                    final jsonContent = jsonEncode(content.toJson());
                    createPost(context, widget.title, jsonContent);
                  },
                  child: const Center(
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
