import 'package:flutter/material.dart';

class Quiz3 extends StatefulWidget {
  const Quiz3({Key? key}) : super(key: key);
  final String title = "Quiz";
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz3> {
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
                '3. Which group is most credited with refining and popularizing the seasoned, deep-fried chicken that became a staple of Southern U.S. cuisine?',
              ),
            ),

            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'A) Scottish immigrants in Appalachia',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'B) African American enslaved cooks in the American South',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'C) French colonists in Louisiana',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'D) Portuguese traders in West Africa',
                ),
              ),
            ),
             
              Padding(padding: padding, child:ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, '/study/quiz2');
              }, child: Text('Back')), ),
              ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/study/quiz4');
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
