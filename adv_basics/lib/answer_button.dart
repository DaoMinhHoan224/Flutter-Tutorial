import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answersText, required this.onTap});

  final String answersText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            //padding in flutter
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            //border in flutter
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )),
        child: Text(
          answersText,
          textAlign: TextAlign.center,
        ));
  }
}
