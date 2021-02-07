import 'package:bmi_calculator_app/providers/bmi_indicators_notifier.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/screens/input_page.dart';
import 'package:provider/provider.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: BmiIndicatorsNotifier(),
        ),
      ],
      child: MaterialApp(
        //debugShowCheckedModeBanner: false, // don't show debug banner in emulator
        title: "BMI Calculator",
        theme: ThemeData.dark().copyWith(
          primaryColor: kMainColor,
          accentColor: Colors.purple,
          scaffoldBackgroundColor: kMainColor,
          textTheme: TextTheme(
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: InputPage(),
      ),
    );
  }
}
