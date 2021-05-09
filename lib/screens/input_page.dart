import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkedin07bmicalculator/components/bottom_button.dart';
import 'package:linkedin07bmicalculator/components/icon_content.dart';
import 'package:linkedin07bmicalculator/components/reusable_card.dart';
import 'package:linkedin07bmicalculator/components/round_icon_button.dart';
import 'package:linkedin07bmicalculator/constants.dart';
import 'package:linkedin07bmicalculator/screens/result_page.dart';
import 'package:linkedin07bmicalculator/bmi_calculator.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  static const MALE = true;
  bool maleActive = false;
  Color femaleCardColor = reusableCardColor;
  int height = 180;
  int weight = 60;
  int age = 24;

  void setMaleActive(bool active) {
    maleActive = active;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      setMaleActive(MALE);
                    });
                  },
                  backgroundColor:
                      maleActive ? reusableCardColor : inactiveCardColor,
                  cardChild:
                      GenderCard(text: 'MALE', icon: FontAwesomeIcons.mars),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onTap: () {
                    setState(() {
                      setMaleActive(!MALE);
                    });
                  },
                  backgroundColor:
                      maleActive ? inactiveCardColor : reusableCardColor,
                  cardChild:
                      GenderCard(text: 'FEMALE', icon: FontAwesomeIcons.venus),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
                onTap: () {},
                backgroundColor: reusableCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT', style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kFatLabelTextStyle,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
              child: Row(children: [
            Expanded(
              child: ReusableCard(
                  onTap: () {},
                  backgroundColor: reusableCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kLabelTextStyle),
                      Text(weight.toString(), style: kFatLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                if (weight < 200) weight++;
                              });
                            },
                          ),
                          SizedBox(width: 6.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (weight > 1) weight--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ReusableCard(
                  onTap: () {},
                  backgroundColor: reusableCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kLabelTextStyle),
                      Text(age.toString(), style: kFatLabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                if (age < 120) age++;
                              });
                            },
                          ),
                          SizedBox(width: 6.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                if (age > 1) age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ])),
          BottomButton(
            label: 'CALCULATE',
            onTap: () {
              BMICalculator bmi = BMICalculator(height, weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmi: bmi.getBMI(),
                            weightStatusColor: bmi.getStatusColor(),
                            weightStatusLabel: bmi.getStatusText(),
                            weightStatusDescription: bmi.getStatusDescripton(),
                          )));
            },
          )
        ],
      ),
    );
  }
}
