import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final List<Map<String, Object?>> userAnswers;
  final VoidCallback onRestart;

  const SummaryScreen({Key? key, required this.userAnswers, required this.onRestart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int correctAnswers = userAnswers.where((answer) => 
      answer['userAnswer'] == answer['correctAnswer']
    ).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Summary'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: userAnswers.length,
              itemBuilder: (context, index) {
                final answerData = userAnswers[index];
                final question = answerData['question'] as String? ?? 'Question not available';
                final userAnswerIndex = answerData['userAnswer'] as int?;
                final correctAnswerIndex = answerData['correctAnswer'] as int? ?? -1;
                
                // Safely access options, providing a default if null or not a List<String>
                List<String> options = [];
                if (answerData['options'] is List) {
                  options = (answerData['options'] as List).map((e) => e.toString()).toList();
                }

                String userAnswerText = 'Not answered';
                if (userAnswerIndex != null && userAnswerIndex >= 0 && userAnswerIndex < options.length) {
                  userAnswerText = options[userAnswerIndex];
                }

                String correctAnswerText = 'Not available';
                if (correctAnswerIndex >= 0 && correctAnswerIndex < options.length) {
                  correctAnswerText = options[correctAnswerIndex];
                }

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${index + 1}: $question',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your answer: $userAnswerText',
                          style: TextStyle(
                            color: userAnswerIndex == correctAnswerIndex 
                              ? Colors.green 
                              : Colors.red,
                          ),
                        ),
                        Text(
                          'Correct answer: $correctAnswerText',
                          style: const TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Scorecard',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Correct Answers: $correctAnswers / ${userAnswers.length}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  'Accuracy: ${(correctAnswers / userAnswers.length * 100).toStringAsFixed(1)}%',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onRestart,
                  child: const Text('Restart Quiz'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
