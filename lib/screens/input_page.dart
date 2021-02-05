import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/components/gender_content.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/components/calculate_button.dart';
import 'package:bmi_calculator_app/components/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;

  int _height = 150;
  int _weight = 55;
  int _age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                buildMaleBard(),
                buildFemaleCard(),
              ],
            ),
          ),
          buildHeightCard(),
          Expanded(
            child: Row(
              children: [
                buildWeightCard(),
                buildAgeCard(),
              ],
            ),
          ),
          CalculateButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(),
                ),
              );
            },
            label: 'CALCULATE',
          ),
        ],
      ),
    );
  }

  Expanded buildAgeCard() {
    return Expanded(
      child: ReusableCard(
        color: kInactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              _age.toString(),
              style: kValueStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: () {
                    setState(() {
                      _age--;
                    });
                  },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: () {
                    setState(() {
                      _age++;
                    });
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded buildWeightCard() {
    return Expanded(
      child: ReusableCard(
          color: kInactiveCardColor,
          cardChild: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WEIGHT',
                style: kLabelTextStyle,
              ),
              Text(_weight.toString(), style: kValueStyle),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: () {
                      setState(() {
                        _weight--;
                      });
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                    onPressed: () {
                      setState(() {
                        _weight++;
                      });
                    },
                  )
                ],
              )
            ],
          )),
    );
  }

  Expanded buildHeightCard() {
    return Expanded(
      child: ReusableCard(
        color: kInactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEIGHT',
              style: kLabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  _height.toString(),
                  style: kValueStyle,
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            buildSlider(),
          ],
        ),
      ),
    );
  }

  Expanded buildFemaleCard() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.female;
          });
        },
        color: selectedGender == Gender.female
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: GenderCard(
          icon: FontAwesomeIcons.venus,
          label: 'FEMALE',
        ),
      ),
    );
  }

  Expanded buildMaleBard() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.male;
          });
        },
        color: selectedGender == Gender.male
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: GenderCard(
          icon: FontAwesomeIcons.mars,
          label: 'MALE',
        ),
      ),
    );
  }

  SliderTheme buildSlider() {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Colors.white,
        inactiveTrackColor: kLabelColor,
        trackShape: RoundedRectSliderTrackShape(),
        trackHeight: 1.0,
        thumbColor: Color(0xFFEB1555),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        overlayColor: Color(0x1fEB1555),
      ),
      child: Slider(
        min: 10,
        max: 250,
        label: _height.round().toString(),
        value: _height.toDouble(),
        onChanged: (double value) {
          setState(() {
            _height = value.round();
          });
        },
      ),
    );
  }
}
