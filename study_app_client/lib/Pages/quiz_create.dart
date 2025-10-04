import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:study_app_client/pages/quiz.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  final String title = 'Create Quiz';

  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  EdgeInsetsGeometry padding = const EdgeInsets.all(20);
  String topic = ""; // Store search topic text

  // Store dropdown selections as nullable Strings
  String? selectedDifficulty;
  String? selectedLength;
  String? selectedType;

  // Form key state
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
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
                    validator: (String? value) {
                      if (selectedDifficulty == null) {
                        return "Please choose a difficulty.";
                      }
                    },
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
                    onChanged: (value) =>
                        setState(() => selectedLength = value),
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
                    validator: (String? value) {
                      if (selectedLength == null) {
                        return "Please choose a length.";
                      }
                    },
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
                              'Written Response',
                              'Multiple Choice',
                            ]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                    validator: (String? value) {
                      if (selectedType == null) {
                        return "Please choose a type.";
                      }
                    },
                  ),
                ),

                // Create button
                Padding(
                  padding: padding,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Validate the form based on the field validator functions
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      // Pass a simple map as arguments to avoid type issues
                      Navigator.pushNamed(
                        context,
                        '/study/quiz',
                        arguments: QuizArguments(
                          selectedDifficulty!,
                          selectedLength!,
                          topic,
                          selectedType!,
                        ),
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
      ),
    );
  }
}
