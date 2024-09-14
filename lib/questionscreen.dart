import 'dart:math';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  final void Function(List<Map<String, Object?>>) onQuizEnd;

  const QuestionScreen({Key? key, required this.onQuizEnd}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int _currentQuestionIndex = 0;
  late final List<Map<String, Object>> _quizQuestions;
  late final List<int?> _userAnswers;
final List<Map<String, Object>> _questions = [
  {'question': 'What is Flutter?', 'correctAnswer': 2, 'options': ['A bird', 'A programming language', 'A UI toolkit', 'A type of dance']},
  {'question': 'Who developed Flutter?', 'correctAnswer': 1, 'options': ['Apple', 'Google', 'Microsoft', 'Amazon']},
  {'question': 'What is the primary language used in Flutter?', 'correctAnswer': 0, 'options': ['Dart', 'JavaScript', 'Kotlin', 'Swift']},
  {'question': 'Which widget is used to display an image in Flutter?', 'correctAnswer': 1, 'options': ['Text', 'Image', 'Container', 'ListView']},
  {'question': 'Which Flutter component is used to manage app navigation?', 'correctAnswer': 2, 'options': ['Scaffold', 'MaterialApp', 'Navigator', 'AppBar']},
  {'question': 'Which method is used to create a new instance of a StatefulWidget?', 'correctAnswer': 0, 'options': ['createState', 'initState', 'build', 'dispose']},
  {'question': 'What is the purpose of a BuildContext?', 'correctAnswer': 1, 'options': ['To manage state', 'To locate widgets in the widget tree', 'To handle user input', 'To manage animations']},
  {'question': 'What is the default alignment for widgets in a Column?', 'correctAnswer': 3, 'options': ['Center', 'Start', 'End', 'Stretch']},
  {'question': 'Which widget is used to display a list of items in Flutter?', 'correctAnswer': 2, 'options': ['ListView', 'GridView', 'Column', 'Row']},
  {'question': 'Which of the following is not a type of Flutter widget?', 'correctAnswer': 0, 'options': ['DataWidget', 'StatelessWidget', 'StatefulWidget', 'InheritedWidget']},
  {'question': 'How do you define a stateless widget?', 'correctAnswer': 1, 'options': ['class MyWidget extends StatefulWidget', 'class MyWidget extends StatelessWidget', 'class MyWidget extends Widget', 'class MyWidget extends Component']},
  {'question': 'What is the purpose of the setState method?', 'correctAnswer': 2, 'options': ['To build a new widget', 'To dispose of a widget', 'To update the state of a widget', 'To handle user input']},
  {'question': 'What does the FutureBuilder widget do?', 'correctAnswer': 1, 'options': ['Builds a widget based on asynchronous data', 'Manages a list of widgets', 'Displays an image', 'Creates a new Future']},
  {'question': 'What is an InheritedWidget used for?', 'correctAnswer': 0, 'options': ['To propagate information down the widget tree', 'To handle user input', 'To create a new widget', 'To manage state']},
  {'question': 'Which widget is used to create a scrolling list of items?', 'correctAnswer': 1, 'options': ['GridView', 'ListView', 'SingleChildScrollView', 'CustomScrollView']},
  {'question': 'How do you manage state in a StatefulWidget?', 'correctAnswer': 2, 'options': ['Using the build method', 'Using a provider', 'Using the setState method', 'Using the initState method']},
  {'question': 'What does the Scaffold widget provide?', 'correctAnswer': 0, 'options': ['Basic material design layout structure', 'State management', 'Data storage', 'Network requests']},
  {'question': 'What is the purpose of the build method?', 'correctAnswer': 3, 'options': ['To update the state', 'To initialize the widget', 'To dispose of the widget', 'To describe the part of the user interface represented by this widget']},
  {'question': 'How do you handle user input in Flutter?', 'correctAnswer': 1, 'options': ['Using the GestureDetector widget', 'Using the TextField widget', 'Using the Container widget', 'Using the Scaffold widget']},
  {'question': 'What is a widget tree?', 'correctAnswer': 2, 'options': ['A data structure for managing state', 'A way to handle animations', 'A hierarchical arrangement of widgets', 'A method for rendering images']},
  {'question': 'What is the purpose of the Navigator widget?', 'correctAnswer': 3, 'options': ['To manage app navigation and routes', 'To create a new widget', 'To manage state', 'To handle user input']},
  {'question': 'Which method is called when a StatefulWidget is created?', 'correctAnswer': 1, 'options': ['initState', 'createState', 'build', 'dispose']},
  {'question': 'What is a StatelessWidget?', 'correctAnswer': 0, 'options': ['A widget that does not maintain any state', 'A widget that can manage state', 'A widget used for animations', 'A widget for handling user input']},
  {'question': 'What does the Text widget do?', 'correctAnswer': 2, 'options': ['Displays text on the screen', 'Handles user input', 'Manages state', 'Creates new widgets']},
  {'question': 'How can you perform a network request in Flutter?', 'correctAnswer': 1, 'options': ['Using the HTTP package', 'Using the Firebase package', 'Using the SQLite package', 'Using the Provider package']},
  {'question': 'What is the purpose of the runApp function?', 'correctAnswer': 0, 'options': ['To start the Flutter app', 'To create a new widget', 'To manage state', 'To handle user input']},
  {'question': 'What is a BuildContext?', 'correctAnswer': 3, 'options': ['A data structure for managing state', 'A method for handling user input', 'A widget for rendering images', 'A reference to the location of a widget in the widget tree']},
  {'question': 'Which of the following is used for local data storage?', 'correctAnswer': 2, 'options': ['Cloud Firestore', 'Firebase Realtime Database', 'SharedPreferences', 'SQL Database']},
  {'question': 'How do you handle asynchronous operations in Flutter?', 'correctAnswer': 0, 'options': ['Using Futures and async/await', 'Using the Navigator widget', 'Using the InheritedWidget', 'Using the State class']},
  {'question': 'What is the primary role of the MaterialApp widget?', 'correctAnswer': 1, 'options': ['To provide material design visual structure', 'To manage app state', 'To create a new widget', 'To handle network requests']},
  {'question': 'Which widget is used to create a rounded button?', 'correctAnswer': 0, 'options': ['ElevatedButton', 'TextButton', 'IconButton', 'FloatingActionButton']},
  {'question': 'What does the Padding widget do?', 'correctAnswer': 1, 'options': ['Adds padding around a widget', 'Manages state', 'Handles user input', 'Creates new widgets']},
  {'question': 'How do you update the UI in Flutter?', 'correctAnswer': 2, 'options': ['Using the setState method', 'Using the InheritedWidget', 'Using the build method', 'Using the Scaffold widget']},
  {'question': 'What is the role of the StatefulWidget?', 'correctAnswer': 3, 'options': ['To handle asynchronous data', 'To manage user input', 'To create new widgets', 'To maintain mutable state']},
  {'question': 'Which widget is used to create a row of widgets?', 'correctAnswer': 0, 'options': ['Row', 'Column', 'Stack', 'ListView']},
  {'question': 'How can you improve performance in a Flutter app?', 'correctAnswer': 1, 'options': ['Using const constructors', 'Using unnecessary setState calls', 'Avoiding widget rebuilding', 'Minimizing widget reuse']},
  {'question': 'What is the purpose of the `async` keyword in Dart?', 'correctAnswer': 0, 'options': ['To mark a function as asynchronous', 'To define a constant', 'To declare a variable', 'To handle exceptions']},
  {'question': 'What is the purpose of `await` in Dart?', 'correctAnswer': 1, 'options': ['To wait for a Future to complete', 'To declare a variable', 'To initialize an object', 'To handle errors']},
  {'question': 'How can you share state across multiple widgets?', 'correctAnswer': 2, 'options': ['Using a Provider', 'Using StatefulWidget', 'Using InheritedWidget', 'Using setState']},
  {'question': 'What is the main difference between `StatefulWidget` and `StatelessWidget`?', 'correctAnswer': 0, 'options': ['StatefulWidget can hold mutable state', 'StatelessWidget can hold mutable state', 'StatefulWidget cannot be rebuilt', 'StatelessWidget cannot have children']},
  {'question': 'Which widget allows for animations and transitions in Flutter?', 'correctAnswer': 1, 'options': ['AnimatedContainer', 'Container', 'Column', 'Row']},
  {'question': 'What is the purpose of the `didChangeDependencies` method in StatefulWidget?', 'correctAnswer': 2, 'options': ['To be called when the widget’s dependencies change', 'To initialize the widget', 'To dispose of the widget', 'To update the widget’s state']},
  {'question': 'How can you optimize a Flutter app for smooth scrolling?', 'correctAnswer': 1, 'options': ['Use ListView.builder', 'Use a ScrollController', 'Use a Column widget', 'Use a Stack widget']},
  {'question': 'What is a `Key` used for in Flutter widgets?', 'correctAnswer': 0, 'options': ['To preserve widget state during rebuilds', 'To manage widget layout', 'To handle user input', 'To create animations']},
  {'question': 'Which widget provides a scrollable area with a fixed header?', 'correctAnswer': 1, 'options': ['CustomScrollView', 'ListView', 'GridView', 'Column']},
  {'question': 'How can you access device-specific features such as the camera in Flutter?', 'correctAnswer': 2, 'options': ['Using plugins', 'Using state management', 'Using InheritedWidget', 'Using HTTP requests']},
  {'question': 'What does the `dispose` method do in a StatefulWidget?', 'correctAnswer': 0, 'options': ['Releases resources when the widget is removed from the tree', 'Initializes the widget', 'Updates the widget state', 'Handles user input']},
  {'question': 'What is the role of `WidgetsBindingObserver`?', 'correctAnswer': 1, 'options': ['To observe the lifecycle of the app', 'To handle user input', 'To manage state', 'To create animations']},
  {'question': 'What is the purpose of the `build` method in a StatefulWidget?', 'correctAnswer': 2, 'options': ['To describe the part of the user interface represented by this widget', 'To manage state', 'To initialize the widget', 'To handle user input']},
  {'question': 'How can you create a custom widget in Flutter?', 'correctAnswer': 1, 'options': ['By extending StatelessWidget or StatefulWidget', 'By using only existing widgets', 'By using the Container widget', 'By creating a new package']},
  {'question': 'What is a `Future` in Dart?', 'correctAnswer': 2, 'options': ['A type that represents a value that will be available in the future', 'A type that handles synchronous data', 'A type for managing state', 'A type for handling errors']},
  {'question': 'How can you improve the startup time of a Flutter app?', 'correctAnswer': 1, 'options': ['Minimize initialization in the main function', 'Use more third-party packages', 'Increase the widget hierarchy depth', 'Reduce the number of assets']},
  {'question': 'What is `flutter_test` used for?', 'correctAnswer': 0, 'options': ['To write and run tests for Flutter widgets', 'To create new Flutter widgets', 'To manage app state', 'To handle asynchronous operations']},
  {'question': 'How can you handle deep linking in a Flutter app?', 'correctAnswer': 2, 'options': ['Using the `uni_links` package', 'Using the `http` package', 'Using the `provider` package', 'Using the `shared_preferences` package']},
  {'question': 'What is the purpose of `GlobalKey` in Flutter?', 'correctAnswer': 1, 'options': ['To uniquely identify widgets and manage their state', 'To handle asynchronous operations', 'To manage network requests', 'To create animations']},
  {'question': 'How can you implement custom animations in Flutter?', 'correctAnswer': 0, 'options': ['By using the `Animation` and `AnimationController` classes', 'By using pre-built animations', 'By using the `InheritedWidget`', 'By using the `Navigator`']},
  {'question': 'What is the `ValueNotifier` class used for?', 'correctAnswer': 1, 'options': ['To provide a way to listen to changes in a value', 'To handle user input', 'To create new widgets', 'To manage state']},
  {'question': 'How can you handle different screen sizes and orientations in Flutter?', 'correctAnswer': 2, 'options': ['Using MediaQuery', 'Using a fixed layout', 'Using only single child widgets', 'Using hardcoded dimensions']},
  {'question': 'What is the purpose of `InheritedWidget`?', 'correctAnswer': 0, 'options': ['To propagate data down the widget tree efficiently', 'To handle user input', 'To manage state', 'To create new widgets']},
  {'question': 'What is the role of the `AppLifecycleState` enum?', 'correctAnswer': 1, 'options': ['To manage the app’s lifecycle events', 'To handle user input', 'To create new widgets', 'To manage animations']},
  {'question': 'How can you achieve efficient image loading in Flutter?', 'correctAnswer': 2, 'options': ['Using the `CachedNetworkImage` package', 'Using static assets only', 'Using large images directly', 'Using `Image.network` only']},
  {'question': 'What is the purpose of the `CustomPainter` class?', 'correctAnswer': 1, 'options': ['To create custom drawings and graphics', 'To manage state', 'To handle user input', 'To create animations']},
  {'question': 'How do you handle multiple asynchronous operations in Flutter?', 'correctAnswer': 0, 'options': ['Using `Future.wait`', 'Using `StreamController`', 'Using `setState`', 'Using `ChangeNotifier`']},
  {'question': 'What is the role of the `Stream` class in Dart?', 'correctAnswer': 2, 'options': ['To handle continuous asynchronous data', 'To manage state', 'To create widgets', 'To perform network requests']},
  {'question': 'How can you use Flutter to build a Progressive Web App (PWA)?', 'correctAnswer': 0, 'options': ['By enabling web support and configuring web-specific settings', 'By using only native widgets', 'By using `Flutter Web` exclusively', 'By using only third-party packages']},
  {'question': 'What is the purpose of the `AutomaticKeepAliveClientMixin`?', 'correctAnswer': 1, 'options': ['To keep the state of a widget alive when it is offscreen', 'To handle user input', 'To manage state', 'To create custom animations']},
  {'question': 'How do you implement offline storage in Flutter?', 'correctAnswer': 2, 'options': ['Using `sqflite` or `hive` packages', 'Using `SharedPreferences`', 'Using only `Firebase`', 'Using `Provider`']},
  {'question': 'What is the purpose of the `Localizations` widget?', 'correctAnswer': 0, 'options': ['To provide localized resources for the app', 'To handle user input', 'To create new widgets', 'To manage state']},
  {'question': 'What does the `debugPaintSizeEnabled` flag do?', 'correctAnswer': 1, 'options': ['Helps visualize widget sizes and layouts for debugging', 'Increases app performance', 'Handles user input', 'Manages state']},
  {'question': 'How do you handle different themes in Flutter?', 'correctAnswer': 2, 'options': ['Using `ThemeData` and `Theme` widget', 'Using `MaterialApp` only', 'Using `InheritedWidget`', 'Using `MediaQuery`']},
  {'question': 'What is the role of the `SingleChildScrollView` widget?', 'correctAnswer': 1, 'options': ['To enable scrolling for a single child', 'To create a scrolling list of items', 'To handle user input', 'To manage state']},
  {'question': 'How can you improve the performance of a Flutter app with many widgets?', 'correctAnswer': 0, 'options': ['Using `const` constructors and `ListView.builder`', 'Using `setState` frequently', 'Avoiding widget reuse', 'Increasing widget hierarchy depth']},
  {'question': 'What is the difference between `WidgetsBinding.instance.addPostFrameCallback` and `Future.microtask`?', 'correctAnswer': 2, 'options': ['`addPostFrameCallback` schedules a callback after the current frame, `microtask` schedules a callback in the microtask queue', '`microtask` is for handling user input, `addPostFrameCallback` is for managing state', '`microtask` schedules a callback after the current frame, `addPostFrameCallback` is for animations', 'There is no difference']},
];

  @override
  void initState() {
    super.initState();
    _quizQuestions = _getRandomQuestions();
    _userAnswers = List<int?>.filled(_quizQuestions.length, null);
  }

  List<Map<String, Object>> _getRandomQuestions() {
    final random = Random();
    final shuffledQuestions = List<Map<String, Object>>.from(_questions)..shuffle(random);
    return shuffledQuestions.take(5).toList();
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _quizQuestions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _endQuiz();
      }
    });
  }

  void _endQuiz() {
    final results = _quizQuestions.asMap().entries.map((entry) {
      final questionIndex = entry.key;
      final questionData = entry.value;
      final correctAnswerIndex = questionData['correctAnswer'] as int;
      return {
        'question': questionData['question'] as String,
        'userAnswer': _userAnswers[questionIndex],
        'correctAnswer': correctAnswerIndex,
        'options': questionData['options'],
      };
    }).toList();

    widget.onQuizEnd(results);
  }

  void _selectOption(int selectedIndex) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = selectedIndex;
    });

    Future.delayed(const Duration(milliseconds: 300), _nextQuestion);
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _quizQuestions[_currentQuestionIndex];
    final options = currentQuestion['options'] as List<String>;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LinearProgressIndicator(
                value: (_currentQuestionIndex + 1) / _quizQuestions.length,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
              const SizedBox(height: 24),
              Text(
                'Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(
                    currentQuestion['question'] as String,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        onPressed: () => _selectOption(index),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          options[index],
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}