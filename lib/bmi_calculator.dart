import 'package:flutter/material.dart';

class BMICalculator {
  BMICalculator(this.height, this.weight) {
    bmi = (weight / ((height / 100) * (height / 100)));
    if (bmi < 18.5) {
      statusColor = Colors.yellow;
      statusText = "UNDERWEIGHT";
      statusDescription = "You have a lower than normal body weight. Try to eat more.";
    } else if (bmi >= 18.5 && bmi < 25) {
      statusColor = Colors.green;
      statusText = "NORMAL";
      statusDescription = "Excellent! You have right BMI.";
    } else if (bmi >= 25 && bmi < 30) {
      statusColor = Colors.yellow;
      statusText = "OVERWEIGHT";
      statusDescription = "You have a higher than normal body weight. Try to exercise more.";
    } else {
      statusColor = Colors.red;
      statusText = "OBESE";
      statusDescription = "You have much higher than normal body weight. Try to exercise more!";
    }
  }

  final int height;
  final int weight;
  double bmi = 0;
  Color statusColor = Colors.white;
  String statusText = "";
  String statusDescription = "";

  String getBMI() {
    return bmi.toStringAsFixed(1);
  }

  Color getStatusColor() {
    return statusColor;
  }

  String getStatusText() {
    return statusText;
  }

  String getStatusDescripton() {
    return statusDescription;
  }
}
