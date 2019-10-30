import 'dart:math';

class Calculator {
  Calculator({this.weight, this.height});

  final int height;
  final int weight;
  double _bmi;

  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String result() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5 && _bmi<25) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'A lil excersise must do the magic!';
    } else if (_bmi >= 18.5) {
      return 'You are fit, keep going!';
    } else {
      return 'Bro, you gotta eat up mate! ';
    }
  }
}
