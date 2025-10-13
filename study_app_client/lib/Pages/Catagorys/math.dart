import 'package:flutter/material.dart';
import 'package:study_app_client/Topics/algebra.dart';
import 'package:study_app_client/Topics/calculus.dart';
import 'package:study_app_client/Topics/geometry.dart';
import 'package:study_app_client/Topics/pre_calculus.dart';
import 'package:study_app_client/Topics/generic_note_page.dart';
import 'package:study_app_client/Topics/statistics.dart';

class Math extends StatefulWidget {
  final String title = 'Math';

  const Math({super.key});

  @override
  _MathState createState() => _MathState();
}

class _MathState extends State<Math> {
  List<String> _topics = [
    'Algebra',
    'Geometry',
    'Calculus',
    'Statistics',
    'Pre Calculus',
  ];

  bool _deleteMode = false;

  // Mapping default topics to their existing pages
  final Map<String, Widget> defaultPages = {
    'Algebra': const Algebra(),
    'Geometry': const Geometry(),
    'Calculus': const Calculus(),
    'Statistics': const Statistics(),
    'Pre Calculus': const PreCalculus(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Math',
                  style: const TextStyle(
                    fontSize: 36,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Row with Delete and Create+
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton.tonal(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: _deleteMode
                          ? const Color.fromARGB(255, 250, 103, 103)
                          : const Color.fromARGB(255, 103, 181, 250),
                    ),
                    onPressed: () {
                      setState(() {
                        _deleteMode = !_deleteMode;
                      });
                    },
                    child: Text(
                      _deleteMode ? 'Delete ON' : 'Delete',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  FilledButton.tonal(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 103, 181, 250),
                    ),
                    onPressed: () {
                      _dialogBuilder(context);
                    },
                    child: const Text(
                      'Create+',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Topics:',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),

              // All topics dynamically
              Column(
                children: _topics
                    .map((topic) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _buildTopicButton(topic),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopicButton(String title) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FilledButton.tonal(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: _deleteMode
              ? const Color.fromARGB(255, 250, 103, 103)
              : const Color.fromARGB(255, 103, 181, 250),
        ),
        onPressed: () {
          if (_deleteMode) {
            setState(() {
              _topics.remove(title);
            });
          } else {
            if (defaultPages.containsKey(title)) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => defaultPages[title]!),
              );
            } else {
              // new topics -> open GenericNotePage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GenericNotePage(title: title),
                ),
              );
            }
          }
        },
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Create Topic Title'),
          content: TextField(
            controller: _textController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Type Here',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Enter'),
              onPressed: () {
                if (_textController.text.isNotEmpty) {
                  setState(() {
                    _topics.add(_textController.text);
                  });
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
