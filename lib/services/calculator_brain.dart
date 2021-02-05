import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.age, this.height, this.weight});

  int height;
  int weight;
  int age;

  double _bmi;

  String calculateBMI() {
    double heightInMeters = height / 100;
    _bmi = weight / pow(heightInMeters, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi < 18.5) {
      return 'Underweight';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  String getInterpretation() {
    if (_bmi < 18.5) {
      return 'You have a lower than normal body weight. You can eat a bit more';
    } else if (_bmi >= 18.5 && _bmi <= 24.9) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a higer than normal body weight. Try to exercise more.';
    }
  }
}
