import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart'; // Import your Quiz widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Quiz(), // Set the home to the Quiz widget
    );
  }
}
