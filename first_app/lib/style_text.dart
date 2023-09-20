import 'package:flutter/material.dart';

class StyleText extends StatelessWidget {
  const StyleText(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return const Text(
      "hello world!",
      style: TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}
