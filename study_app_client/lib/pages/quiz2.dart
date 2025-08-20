import 'package:flutter/material.dart';

class Quiz2 extends StatefulWidget {
  const Quiz2({ Key? key }) : super(key: key);
  final String title = "Quiz";

  @override
  _Quiz2State createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
   ButtonStyle style = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(10),
  );
  EdgeInsetsGeometry padding = EdgeInsetsGeometry.all(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // horizontal
          children: <Widget>[
            Padding(
              padding: padding,
              child: Text(
                '2. Which of the following dishes is traditionally from Japan?',
              ),
            ),

            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'A) Paella',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'B) Bibimbap',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'C) Sushi',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'D) Moussaka',
                ),
              ),
            ),
              Padding(padding: padding, child:ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/study/quiz');
              }, child: Text('Back')), ),
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/study/quiz3');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}