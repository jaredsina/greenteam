import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:http/http.dart' as http;
import 'dart:convert'; 

Future<void> createPost(BuildContext context, catagory, String notes) async {
  //blank until api link provided
  final url = Uri.parse('http://127.0.0.1:4000/notes/post');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'note' : notes,
      'catagory': catagory,
      // placeholder
      'user_id': 1,
    }
    )
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Note created and saved.')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to save.'))
    );
  }

}



Future<List<dynamic>> fetchNotesList(String category) async {
  final url = Uri.parse('http://127.0.0.1:4000/notes/get/$category');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load notes');
  }
}


class Algebra extends StatefulWidget {
  final String title = 'Algebra';

  const Algebra({super.key});

  @override
  _AlgebraState createState() => _AlgebraState();
}

class _AlgebraState extends State<Algebra> {
  late quill.QuillController controller;
  String? latestNoteId;

  @override
  void initState() {
    super.initState();
    controller = quill.QuillController.basic();
    _fetchLatestNote();  // load latest note on startup
  }

  Future<void> _fetchLatestNote() async {
    try {
      final url = Uri.parse('http://127.0.0.1:4000/notes/get/algebra');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> notes = jsonDecode(response.body);

        if (notes.isNotEmpty) {
          final latestNote = notes.last;
          latestNoteId = latestNote['_id'];

          final noteContent = latestNote['note'];

          // convert JSON back to Quill Document
          final doc = quill.Document.fromJson(jsonDecode(noteContent));

          // 🔹 update controller inside setState so UI rebuilds
          setState(() {
            controller = quill.QuillController(
              document: doc,
              selection: const TextSelection.collapsed(offset: 0),
            );
          });
        }
      } else {
        print("Error fetching notes: ${response.body}");
      }
    } catch (e) {
      print("Error fetching notes: $e");
    }
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
                'Algebra',
                style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 40),

            // 🔹 Use the controller that gets updated by fetch
            quill.QuillSimpleToolbar(controller: controller),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFF000000)),
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
                  config: const quill.QuillEditorConfig(
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
                    backgroundColor:
                        const Color.fromARGB(255, 103, 181, 250),
                  ),
                  onPressed: () {
                    final content = controller.document.toDelta();
                    final jsoncontent = jsonEncode(content.toJson());
                    createPost(context, 'algebra', jsoncontent);
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
