import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

Future<void> createPost(BuildContext context, username, password) async {
  final url = Uri.parse('http://127.0.0.1:4000/signup/create');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  if (response.statusCode == 201) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('User created and saved.')));
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Failed to save.')));
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  final String title = 'SignUp';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    final quill.QuillController controller = quill.QuillController.basic();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 50)),
              SizedBox(height: 40),
              Text("Enter your Email:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter Email",
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),

              SizedBox(height: 35),
              Text("Enter your password:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter password",
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),

              SizedBox(height: 35),
              Text("Reenter your password:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Reenter password",
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: FilledButton.tonal(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color.fromARGB(255, 0, 174, 255),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                        createPost(context, email, password);
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Text('Submit', style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: FilledButton.tonal(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(100, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signlog');
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Text('Cancel', style: TextStyle(fontSize: 16)),
                        ],
                      ),
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
