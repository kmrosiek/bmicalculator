import 'package:flutter/material.dart';
import 'package:linkedin07bmicalculator/constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({required this.text, required this.icon});

  final text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 80.0),
        SizedBox(height: 15.0),
        Text(text,
              style: kLabelTextStyle
        )
      ],
    );
  }
}