import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_nav_button.dart';
import 'package:bmi_calculator/components/round_button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  int height = 180;
  int weight = 30;
  int age = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedCard = Gender.male;
                    });
                  },
                  colour: selectedCard == Gender.male
                      ? activeCardColor
                      : containerColor,
                  childComponent: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
                ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedCard = Gender.female;
                    });
                  },
                  colour: selectedCard == Gender.female
                      ? activeCardColor
                      : containerColor,
                  childComponent: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: containerColor,
                    childComponent: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelText,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelText,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 10.0),
                            overlayColor: activeCardColor,
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 25.0),
                            inactiveTrackColor: Colors.white54,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  colour: containerColor,
                  childComponent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kLabelText,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        weight.toString(),
                        style: kTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                              iconData: FontAwesomeIcons.minus,
                              calc: () {
                                setState(() {
                                  weight -= 1;
                                });
                              }),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                            iconData: FontAwesomeIcons.plus,
                            calc: () {
                              setState(() {
                                weight += 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: containerColor,
                  childComponent: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'AGE',
                        style: kLabelText,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        age.toString(),
                        style: kTextStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundButton(
                            iconData: FontAwesomeIcons.minus,
                            calc: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          RoundButton(
                            iconData: FontAwesomeIcons.plus,
                            calc: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          BottomButtom(
            text: 'CALCULATE',
            onTap: () {
              Calculator calc = Calculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmi: calc.calculate(),
                    resultText: calc.result(),
                    tips: calc.interpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
