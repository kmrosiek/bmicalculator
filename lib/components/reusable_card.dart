
import 'package:flutter/material.dart';
import 'package:linkedin07bmicalculator/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({this.backgroundColor = reusableCardColor, required this.cardChild, required this.onTap});

  final Color backgroundColor;
  final Widget cardChild;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          child: cardChild,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
    );
  }
}
