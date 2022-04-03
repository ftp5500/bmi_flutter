import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'widgets/ReusableCard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widgets/icon_content.dart';
import './constants/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int _height = 120;

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
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                      iconColour: selectedGender == Gender.male
                          ? kMaleIconColour
                          : Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                      iconColour: selectedGender == Gender.female
                          ? kFemaleIconColour
                          : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(_height.round().toString(),
                                style: kNumberTextStyle),
                            Text("cm", style: kLabelTextStyle),
                          ],
                        ),
                        Slider(
                          value: _height.toDouble(),
                          // thumbColor: kBottomContainerColour,
                          activeColor: kBottomContainerColour,
                          inactiveColor: Color(0xFF8D8E98),
                          min: 80,
                          max: 250,
                          divisions: 250,
                          onChanged: (double value) {
                            setState(() {
                              _height = value.toInt();
                            });
                          },
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
              children: [
                Expanded(
                  child: ReusableCard(colour: kActiveCardColour),
                ),
                Expanded(
                  child: ReusableCard(colour: kActiveCardColour),
                ),
              ],
            ),
          ),
          Container(
            child: Center(
              child: Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            margin: EdgeInsets.only(top: 15.5),
            height: kBottomContainerHeight,
            width: double.infinity,
            color: kBottomContainerColour,
          )
        ],
      ),
    );
  }
}
