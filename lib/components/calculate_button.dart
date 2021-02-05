import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.onPressed, @required this.label});

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: kCalculateButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
