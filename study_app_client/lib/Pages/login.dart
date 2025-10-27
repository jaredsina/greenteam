import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> sendLogin(BuildContext context, username, password) async {
  final url = Uri.parse('http://127.0.0.1:4000/auth_routes/post');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    Navigator.pushNamed(context, '/home');
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('User found and brought.')));
  } else {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Failed to find.')));
  }
}

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  final String title = 'LogIn';

  @override
  State<Login> createState() => _LogInState();
}

class _LogInState extends State<Login> {
  String username = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Log In", style: TextStyle(fontSize: 50)),

              SizedBox(height: 35),
              Text("Enter your username:", style: TextStyle(fontSize: 25)),
              SearchBar(
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16),
                ),
                hintText: "Enter username",
                onChanged: (value) {
                  setState(() {
                    username = value;
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
                        sendLogin(context, username, password);
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          Text('Enter', style: TextStyle(fontSize: 16)),
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
