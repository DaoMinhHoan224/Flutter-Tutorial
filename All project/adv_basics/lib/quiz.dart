import 'package:adv_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/startScreen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:adv_basics/data/question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = "start-screen";
  //sử dụng initState
  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen = Start_Screen(switchScreen);

  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuestionsScreen();
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    print(selectedAnswer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswer = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    // Widget screenWidget = Start_Screen(switchScreen);
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.deepPurple.shade800,
            body: activeScreen == 'start-screen'
                ? Start_Screen(switchScreen)
                : activeScreen == 'question-screen'
                    ? QuestionsScreen(onSelectedAnswer: chooseAnswer)
                    : activeScreen == 'result-screen'
                        ? ResultScreen(
                            chooseAnswer: selectedAnswer,
                            onRestart: restartQuiz,
                          )
                        : QuestionsScreen(onSelectedAnswer: chooseAnswer)));
  }
}
