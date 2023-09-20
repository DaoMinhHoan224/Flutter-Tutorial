import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary/question_summary.dart';
import 'package:adv_basics/data/question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chooseAnswer, required this.onRestart});

  final void Function() onRestart;
  final List<String> chooseAnswer;
  //trả về danh sách giá trị bằng Map
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chooseAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chooseAnswer[i]
      });
    }
    print(summary);
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
          //margin tẩt cả
          margin: const EdgeInsets.all(20),

          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 300,
              child: Text(
                "You answer $numCorrectQuestion out of $numTotalQuestion question correctly!",
                style: const TextStyle(
                  color: Color.fromARGB(255, 219, 163, 215),
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                  // padding: EdgeInsets.only(top: 20),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 30)),
              icon: const Icon(Icons.refresh),
              label: const Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            )
          ]),
        ));
  }
}
