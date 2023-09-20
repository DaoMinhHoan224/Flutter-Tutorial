import 'package:flutter/material.dart';
import 'package:todo_app/demo_buttons.dart';

class UIUpdatesDemo extends StatefulWidget {
  const UIUpdatesDemo({super.key});

  @override
  StatefulElement createElement() {
    print("UIUpdateDemo CreateElement called");
    return super.createElement();
  }

  @override
  State<UIUpdatesDemo> createState() {
    return _UIUpdatesDemo();
  }
}

class _UIUpdatesDemo extends State<UIUpdatesDemo> {
  var _isUnderstood = false;

  @override
  Widget build(BuildContext context) {
    print('UIUpdateDemo build called');
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Every Flutter developer should have a basic understading of Flutter\'s internal!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Do you understand how Flutter updates UIs ",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 24,
            ),
            DemoButtons(),
          ],
        ),
      ),
    );
  }
}
