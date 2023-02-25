import 'package:flutter/material.dart';

class Reusable_card extends StatelessWidget {
  const Reusable_card(
      {super.key,
      this.colour = const Color(0xff1D1E33),
      required this.cardChild,
      required this.onPress});

  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0), color: colour),
      ),
    );
  }
}
