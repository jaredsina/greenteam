import 'package:flutter/material.dart';
 
class Notes extends StatefulWidget {
  final String title = 'Notes';


  const Notes({Key? key}) : super(key: key);
  
  @override
  _NotesState createState() => _NotesState();
}


class _NotesState extends State<Notes> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
        
      ),  
     );
  }
}