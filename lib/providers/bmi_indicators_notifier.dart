import 'package:flutter/widgets.dart';
import 'package:bmi_calculator_app/gender_enum.dart';

class BmiIndicatorsNotifier extends ChangeNotifier {
  int _weight = 50;
  int _height = 150;
  int _age = 20;
  bool _disableMinusButton = false;
  bool _disablePlusButton = false;
  Gender _gender;

  get getWeight => _weight;

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void reduceWeight() {
    _weight--;
    notifyListeners();
  }

  get getHeight => _height;

  void changeHeight(int value) {
    _height = value;
    notifyListeners();
  }

  get getAge => _age;
  get isMinusButtonDisabled => _disableMinusButton;
  get isPlusButtonDisabled => _disablePlusButton;

  void incrementAge() {
    if (_age >= 65) {
      _disablePlusButton = true;
      _disableMinusButton = false;
    } else {
      _age++;
    }

    notifyListeners();
  }

  void reduceAge() {
    if (_age <= 18) {
      _disableMinusButton = true;
      _disablePlusButton = false;
    } else {
      _age--;
    }
    notifyListeners();
  }

  get getGender => _gender;

  void changeGender(Gender gender) {
    _gender = gender;
    notifyListeners();
  }
}
