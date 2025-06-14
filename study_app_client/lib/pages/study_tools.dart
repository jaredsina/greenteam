import 'package:flutter/material.dart';

class Study extends StatefulWidget {
  const Study({Key? key}) : super(key: key);

  final String title = 'Study';

  @override
  _StudyState createState() => _StudyState();
}

class _StudyState extends State<Study> {
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
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25),
              child: 
              FilledButton.tonal(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250,150), 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Color.fromARGB(255, 103, 181, 250)
                ),
                onPressed: () {
                  Navigator.pushNamed(context,'/study/quiz');
                },
                child: Text('Quiz/Test', style: TextStyle(fontSize: 35),),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(25),
              child:
              FilledButton.tonal(
                style: ElevatedButton.styleFrom(fixedSize: const Size(250,150), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color.fromARGB(255, 100, 148, 237)
                 ),

                onPressed: () {
                  Navigator.pushNamed(context,'/study/flashcard');
                },
                child: Text('Flashcards', style: TextStyle(fontSize: 35)),
              ),
             ),
            Padding(
              padding: EdgeInsets.all(25),
              child:
              FilledButton.tonal(
                style: ElevatedButton.styleFrom(fixedSize: const Size(250,150), 
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                backgroundColor: Color.fromARGB(255, 100, 216, 237) 
                ),
                onPressed: () {
                  Navigator.pushNamed(context,'/study/match');
                },
                child: Text('Matching', style: TextStyle(fontSize: 35),),
              ),
             ),
          ],
        ),
      ),
    );
  }
}
