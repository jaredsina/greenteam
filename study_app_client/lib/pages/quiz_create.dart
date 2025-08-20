import 'dart:ui';
import 'package:flutter/material.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  final String title = 'Create Quiz';

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

// Store dropdown selections as nullable Strings
String? selectedDifficulty;
String? selectedLength;
String? selectedType;

class _CreateQuizState extends State<CreateQuiz> {
  EdgeInsetsGeometry padding = const EdgeInsets.all(20);
  String topic = ""; // Store search topic text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Create Quiz/Test',
                style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
              ),
              const Text(
                'Type Topic',
                style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
              ),

              // Search Bar for topic
              Padding(
                padding: padding,
                child: SearchBar(
                  leading: const Icon(Icons.search),
                  hintText: "Type a Topic",
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      topic = value;
                    });
                  },
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
                  style: const TextStyle(color: Colors.black),
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
                  style: const TextStyle(color: Colors.black),
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
                  style: const TextStyle(color: Colors.black),
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

              // Create button
              Padding(
                padding: padding,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Pass a simple map as arguments to avoid type issues
                    Navigator.pushNamed(
                      context,
                      '/study/quiz',
                      arguments: {
                        'selectedDifficulty': selectedDifficulty,
                        'selectedLength': selectedLength,
                        'selectedType': selectedType,
                        'topic': topic,
                      },
                    );
                  },
                  label: const Text('Create'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
