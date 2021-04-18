import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin07bmicalculator/reusable_card.dart';

import 'icon_content.dart';

const bottomContainerHeight = 80.0;
const bottomContainerColor = Color(0xFFEB1555);
const reusableCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(children: [
            ReusableCard(
              backgroundColor: reusableCardColor,
              cardChild: GenderCard(text: 'MALE', icon: FontAwesomeIcons.mars),
            ),
            ReusableCard(
              backgroundColor: reusableCardColor,
              cardChild:
                  GenderCard(text: 'FEMALE', icon: FontAwesomeIcons.venus),
            ),
          ])),
          ReusableCard(
            backgroundColor: reusableCardColor,
            cardChild: Text('BMI'),
          ),
          Expanded(
              child: Row(children: [
            ReusableCard(
              backgroundColor: reusableCardColor,
              cardChild: Text('a'),
            ),
            ReusableCard(
              backgroundColor: reusableCardColor,
              cardChild: Text('b'),
            ),
          ])),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
