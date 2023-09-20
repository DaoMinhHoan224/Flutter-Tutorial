// import 'package:first_app/style_text.dart';
import 'package:first_app/dice_role.dart';
import 'package:flutter/material.dart';

const beginAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

final class GradientContainer extends StatelessWidget {
  //required dùng để đưa biến lên khai báo đầu tiên
  const GradientContainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
          //1 dải màu theo chiều ngang hoặc chiều dọc
          gradient: LinearGradient(
              colors: colors,
              //bắt đầu dải màu
              begin: beginAlignment,
              //kết thúc dải màu
              end: endAlignment)),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
