import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);
  final String title = "Quiz";
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  ButtonStyle style = ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(10)
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
            Padding(padding: padding, child: Text(
                '1. Which of the following statements about the Late Cretaceous theropod Troodon is most accurate, based on current paleontological evidence?',
              ), ),
            
            Padding(padding: padding, child:OutlinedButton(
              onPressed: () {},
              style: style,
              child: Text(
                'A) Troodon had one of the smallest brain-to-body ratios among non-avian dinosaurs, indicating it relied mainly on instinct rather than learned behavior.',
              ),
            ),),
            Padding(padding: padding, child: OutlinedButton(
              onPressed: () {},
              style: style,
              child: Text(
                'B) Fossilized nests attributed to Troodon suggest it laid a single egg per clutch, similar to most modern reptiles.',
              ),
            ), ),
            Padding(padding: padding, child: OutlinedButton(
              onPressed: () {},
              style: style,
              child: Text(
                'C) Troodon possessed serrated teeth and stereoscopic vision, indicating it was likely an omnivore or a predator with complex hunting strategies.',
              ),
            ), ),
            Padding(padding: padding, child: OutlinedButton(
              onPressed: () {},
              style: style,
              child: Text(
                'D) The Troodon genus is now considered entirely invalid, with all fossils reclassified under the genus Velociraptor after DNA analysis.',
              ),
            ), ),
          ],
        ),
      ),
    );
  }
}
