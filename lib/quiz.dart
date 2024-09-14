import 'package:flutter/material.dart';
import 'package:quiz_app/questionscreen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/summary_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = Startscreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onQuizEnd: (results) {
          setState(() {
            activeScreen = SummaryScreen(
              userAnswers: results,
              onRestart: () {
                setState(() {
                  activeScreen = Startscreen(switchScreen);
                });
              },
            );
          });
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 27, 6, 65),
                Color.fromARGB(255, 70, 39, 156),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
