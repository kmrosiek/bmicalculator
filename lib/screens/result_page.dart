import 'package:flutter/material.dart';
import 'package:linkedin07bmicalculator/components/bottom_button.dart';
import 'package:linkedin07bmicalculator/components/reusable_card.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmi,
      required this.weightStatusColor,
      required this.weightStatusLabel,
      required this.weightStatusDescription});

  final String weightStatusLabel;
  final Color weightStatusColor;
  final String weightStatusDescription;
  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: Text('Your Result',
                    style:
                        TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold)),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                backgroundColor: reusableCardColor,
                onTap: () {},
                cardChild: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(weightStatusLabel,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                              color: weightStatusColor)),
                      Text(bmi, style: TextStyle(fontSize: 100)),
                      Text(
                        weightStatusDescription,
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                label: 'RE-CALCULATE'),
          ],
        ));
  }
}
