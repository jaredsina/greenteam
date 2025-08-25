import 'dart:ui';

import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  final String title = 'Create CreateQuiz';

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

String? selectedDifficulty;
String? selectedLength;
String? selectedType;

class _CreateQuizState extends State<CreateQuiz> {
  EdgeInsetsGeometry padding = EdgeInsets.all(20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),

      body: Center(
        child: Container(
          width: double.infinity, // Makes Column take up full width
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // horizontal
            children: <Widget>[
              Text(
                'CreateQuiz/Test',
                style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              ),
              Text(
                'Type Topic',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),
              Padding(
                padding: padding,
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: "Type a Topic",
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),

              // Difficulty Dropdown
              Padding(
                padding: padding,
                child: DropdownButtonFormField<String>(
                  value: selectedDifficulty,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue,
                    hintText: 'Difficulty',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: const Color.fromARGB(255, 5, 5, 5)),
                  onChanged: (value) =>
                      setState(() => selectedDifficulty = value),
                  items: ['Easy', 'Medium', 'Hard', 'Expert']
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                      .toList(),
                ),
              ),

              // Length Dropdown
              Padding(
                padding: padding,
                child: DropdownButtonFormField<String>(
                  value: selectedLength,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue,
                    hintText: 'Length',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: const Color.fromARGB(255, 7, 7, 7)),
                  onChanged: (value) => setState(() => selectedLength = value),
                  items:
                      [
                            '5 questions',
                            '10 questions',
                            '15 questions',
                            '20 questions',
                          ]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                ),
              ),

              // Type Dropdown
              Padding(
                padding: padding,
                child: DropdownButtonFormField<String>(
                  value: selectedType,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blue,
                    hintText: 'Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  iconEnabledColor: Colors.white,
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  onChanged: (value) => setState(() => selectedType = value),
                  items:
                      [
                            'True/False',
                            'Matching',
                            'Written Response',
                            'Multiple Choice',
                          ]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                ),
              ),

              Padding(
                padding: padding,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/study/quiz');
                  },
                  label: Text('Create'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                  ),
                  icon: Icon(Icons.add),
                ),
              ),

              Padding(
                padding: padding,
                child: TextButton(
                  onPressed: () => {},
                  child: Text('Import'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
