
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.backgroundColor, required this.cardChild});

  final Color backgroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
