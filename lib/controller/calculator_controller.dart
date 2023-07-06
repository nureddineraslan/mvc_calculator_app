

import '../models/model.dart';

class CalculatorController {
  void addNumbers(CalculatorModel model) {
    model.result = model.number1 + model.number2;
  }
}
