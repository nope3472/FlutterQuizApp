import 'package:flutter/material.dart';

class Startscreen extends StatelessWidget {
  const Startscreen(this.startquiz, {super.key});

  final void Function() startquiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.4, // Set the opacity level
                child: Image.asset(
                  'assets/images/flutter-logo.png',
                  width: 300,
                ),
              ),
              const SizedBox(height: 20), // Spacing between the image and text
              const Opacity(
                opacity: 0.6, // Set the opacity level for the text
                child: Text(
                  'LEARN FLUTTER THE FUN WAY',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Spacing between text and button
              OutlinedButton(
                onPressed: startquiz,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color.fromARGB(255, 123, 95, 95)),
                  foregroundColor: Colors.white,
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white), // Added icon
                    SizedBox(width: 10), // Spacing between icon and text
                    Text(
                      'Start Quiz',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
