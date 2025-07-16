

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert'; 



Future<void> createPost(BuildContext context, catagory, String notes) async {
  //blank until api link provided
  final url = Uri.parse('');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'Catagory': catagory,
      'Notes' : notes,
      // placeholder
      'userId': 1,
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






class Algebra extends StatefulWidget {
  final String title = 'Algebra';

  const Algebra({super.key});

  @override
  _AlgebraState createState() => _AlgebraState();
}
class _AlgebraState extends State<Algebra> {
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
            'Algebra',
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
        const SizedBox(height: 20,),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(180,60),
        alignment: Alignment.bottomRight,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
        onPressed: () {
                },
       child:  Center(
        child: const Text(
                  'Add Image+',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center ,
                ),
       )
                ),
      const SizedBox(width: 20,),
       Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(180,60),
        alignment: Alignment.bottomLeft,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
        backgroundColor: const Color.fromARGB(255, 103, 181, 250),
                ),
        onPressed: () {
                },
       child:  Center(
        child: const Text(
                  'Save',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center ,
                ),
       )
                ),
              
      ]
        
          ),
      ]
          ),
    
    ]
    
    ),
  // ignore: dead_code
  )
    );
}
}
