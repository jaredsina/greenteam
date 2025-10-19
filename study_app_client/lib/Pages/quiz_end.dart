import 'package:flutter/material.dart';

class QuizEnd extends StatefulWidget {
  const QuizEnd({Key? key}) : super(key: key);

  @override
  _QuizEndState createState() => _QuizEndState();
}

class _QuizEndState extends State<QuizEnd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Quiz Results:',
                  style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
