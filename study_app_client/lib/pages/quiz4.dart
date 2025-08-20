import 'package:flutter/material.dart';

class Quiz4 extends StatefulWidget {
  const Quiz4({Key? key}) : super(key: key);
  final String title = "Quiz";
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz4> {
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
                '4. Which of the following best explains why SARS-CoV-2 (the virus that causes COVID-19) is more transmissible than SARS-CoV-1, despite having a lower fatality rate?',
              ),
            ),

            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'A) SARS-CoV-2 mutates at a much slower rate, making it harder for the immune system to detect.',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'B) SARS-CoV-2 infects only the lower respiratory tract, avoiding early detection by the immune system.',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'C) SARS-CoV-2 has a spike protein that binds more efficiently to the ACE2 receptor, allowing easier entry into human cells.',
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: OutlinedButton(
                onPressed: () {},
                style: style,
                child: Text(
                  'D) SARS-CoV-2 is able to survive indefinitely on all surfaces, drastically increasing its transmission window.',
                ),
              ),
            ),

            Padding(
              padding: padding,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/study/quiz3');
                },
                child: Text('Back'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
