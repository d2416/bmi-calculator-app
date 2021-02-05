import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';
import 'package:bmi_calculator_app/components/reusable_card.dart';
import 'package:bmi_calculator_app/components/calculate_button.dart';

class ResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Result',
          style: TextStyle(fontSize: 35.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Normal',
                    style: kResultLabelStyle,
                  ),
                  Text(
                    '20',
                    style: kResultValueStyle,
                  ),
                  Text(
                    'Good job!',
                    style: kResultResultText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            onPressed: () {
              Navigator.pop(context, '/');
            },
            label: 'RE-CALCULATE',
          ),
        ],
      ),
    );
  }
}
