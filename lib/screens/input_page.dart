import 'package:bmi_calculator_app/providers/bmi_indicators_notifier.dart';
import 'package:bmi_calculator_app/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_app/components/gender_content.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/components/calculate_button.dart';
import 'package:bmi_calculator_app/components/round_icon_button.dart';
import 'package:bmi_calculator_app/services/calculator_brain.dart';
import 'package:provider/provider.dart';
import 'package:bmi_calculator_app/gender_enum.dart';

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gender cards
          Expanded(
            child: Row(
              children: [
                genderCard(context, Gender.male, 'MALE', FontAwesomeIcons.mars),
                genderCard(
                    context, Gender.female, 'FEMALE', FontAwesomeIcons.venus),
              ],
            ),
          ),
          // Slider
          heightCard(context),
          // Weight and Age cards
          Expanded(
            child: Row(
              children: [
                weightCard(context),
                ageCard(context),
              ],
            ),
          ),
          CalculateButton(
            onPressed: () {
              CalculatorBrain calc = CalculatorBrain(
                age: Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                    .getAge,
                height:
                    Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                        .getHeight,
                weight:
                    Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                        .getWeight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            label: 'CALCULATE',
          ),
        ],
      ),
    );
  }

  Expanded ageCard(BuildContext context) {
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
              Provider.of<BmiIndicatorsNotifier>(context).getAge.toString(),
              style: kValueStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  icon: FontAwesomeIcons.minus,
                  onPressed: Provider.of<BmiIndicatorsNotifier>(context)
                          .isMinusButtonDisabled
                      ? null
                      : () {
                          Provider.of<BmiIndicatorsNotifier>(context,
                                  listen: false)
                              .reduceAge();
                        },
                ),
                SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: FontAwesomeIcons.plus,
                  onPressed: Provider.of<BmiIndicatorsNotifier>(context)
                          .isPlusButtonDisabled
                      ? null
                      : () {
                          Provider.of<BmiIndicatorsNotifier>(context,
                                  listen: false)
                              .incrementAge();
                        },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded weightCard(BuildContext context) {
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
              Text(
                Provider.of<BmiIndicatorsNotifier>(context)
                    .getWeight
                    .toString(),
                style: kValueStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RoundIconButton(
                    icon: FontAwesomeIcons.minus,
                    onPressed: () {
                      Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                          .reduceWeight();
                    },
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  RoundIconButton(
                    icon: FontAwesomeIcons.plus,
                    onPressed: () {
                      Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                          .incrementWeight();
                    },
                  )
                ],
              )
            ],
          )),
    );
  }

  Expanded heightCard(BuildContext context) {
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
                  Provider.of<BmiIndicatorsNotifier>(context)
                      .getHeight
                      .toString(),
                  style: kValueStyle,
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
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
                label: Provider.of<BmiIndicatorsNotifier>(context)
                    .getHeight
                    .toString(),
                value: Provider.of<BmiIndicatorsNotifier>(context)
                    .getHeight
                    .toDouble(),
                onChanged: (double value) {
                  Provider.of<BmiIndicatorsNotifier>(context, listen: false)
                      .changeHeight(value.round());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded genderCard(
      BuildContext context, Gender gender, String label, IconData icon) {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          Provider.of<BmiIndicatorsNotifier>(context, listen: false)
              .changeGender(gender);
        },
        color: Provider.of<BmiIndicatorsNotifier>(context).getGender == gender
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: GenderCard(
          icon: icon,
          label: label,
        ),
      ),
    );
  }
}
