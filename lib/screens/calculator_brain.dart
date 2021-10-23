import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight.toDouble() / (pow(height.toDouble() / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    return _bmi >= 25
        ? 'Overweight'
        : _bmi > 18.5
            ? 'Normal'
            : 'Underweight';
  }

  String getEmoji() {
    return _bmi >= 25
        ? 'surprise'
        : _bmi > 18.5
            ? 'grin'
            : 'frownOpen';
  }

  String getInterpretation() {
    return _bmi >= 25
        ? 'Your weight is higher than normal body weight. Try to exercise.'
        : _bmi > 18.5
            ? 'Great! You have a normal body weight.'
            : 'Your weight is lower than normal body weight. You can eat more.';
  }
}
