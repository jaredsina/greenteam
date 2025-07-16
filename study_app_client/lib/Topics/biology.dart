
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;


class Biology extends StatefulWidget {
  final String title = 'Biology';

  const Biology({super.key});

  @override
  _BiologyState createState() => _BiologyState();
}
class _BiologyState extends State<Biology> {
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
            'Biology',
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
        )
          ]
       )
          ]
          )
          
      ] 
       )
          
    )
      
  );
  }
  }