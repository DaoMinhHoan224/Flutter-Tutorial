import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  runApp(const MaterialApp(
      home: Scaffold(

          //container là 1 hộp chứa widget
          body: GradientContainer(
    colors: [Colors.black, Color.fromARGB(255, 231, 101, 144)],
  ))));
}
