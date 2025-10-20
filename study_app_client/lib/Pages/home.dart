import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  final String title = 'Home';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 44, 153, 237),
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Hello,\nJanav!", style: TextStyle(fontSize: 50)),
              SizedBox(height: 20),
              SearchBar(
                leading: const Icon(Icons.search),
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/schedule');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 38, 0, 255),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Schedule', style: TextStyle(fontSize: 20)),
                        const Icon(Icons.schedule, size: 28),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/notes');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 18, 12, 96),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Notes', style: TextStyle(fontSize: 25)),
                        const Icon(Icons.auto_stories, size: 28),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 0, 166, 237),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('Study Tools', style: TextStyle(fontSize: 16)),
                        const Icon(Icons.design_services, size: 28),
                      ],
                    ),
                  ),
                  FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/study');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        Color.fromARGB(255, 0, 103, 182),
                      ),
                      minimumSize: WidgetStateProperty.all(Size(150, 150)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    child: Column(
                      spacing: 12,
                      children: [
                        Text('AI Helper', style: TextStyle(fontSize: 25)),
                        const Icon(Icons.smart_toy, size: 28),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
