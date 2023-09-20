import 'package:flutter/material.dart';
import 'dart:math';

final randomimize = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentactiveDiceRoll = 2;

  void rolldice() {
    setState(() {
      currentactiveDiceRoll = randomimize.nextInt(6) + 1; // 1-6;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          //$currentactiveDiceRoll tự động xây dựng đường dẫn là nội dung, hình ảnh, xúc sắc, và sau đó là bất kỳ số nào
          "assets/images/dice-$currentactiveDiceRoll.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: rolldice,
          style: TextButton.styleFrom(
              // padding: EdgeInsets.only(top: 20),
              foregroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 30)),
          child: const Text("Roll dice"),
        )
      ],
    );
  }
}
