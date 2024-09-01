import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Question> _questions = [
    Question(
      text: 'What is the sign for "Hello" in ISL?',
      options: ['👋', '🖐️', '🙋', '👍'],
      correctOptionIndex: 0,
    ),
    Question(
      text: 'What is the sign for "Thank You" in ISL?',
      options: ['🙏', '👍', '💡', '🙌'],
      correctOptionIndex: 0,
    ),
    Question(
      text: 'What is the sign for "Sorry" in ISL?',
      options: ['😔', '🙇', '😓', '😢'],
      correctOptionIndex: 1,
    ),
    Question(
      text: 'What is the sign for "Please" in ISL?',
      options: ['🙏', '🤲', '👐', '🤝'],
      correctOptionIndex: 0,
    ),
    // Add more questions as needed
  ];

  int _currentQuestionIndex = 0;
  List<int?> _selectedAnswers = List.generate(5, (index) => null); // Adjust size as needed

  void _onOptionSelected(int optionIndex) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = optionIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < question.options.length; i++)
              OptionButton(
                text: question.options[i],
                isSelected: _selectedAnswers[_currentQuestionIndex] == i,
                isCorrect: i == question.correctOptionIndex,
                onPressed: () => _onOptionSelected(i),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OptionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onPressed;

  const OptionButton({
    required this.text,
    required this.isSelected,
    required this.isCorrect,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? (isCorrect ? Colors.green : Colors.red)
              : Colors.grey[300],
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 16),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
  });
}
