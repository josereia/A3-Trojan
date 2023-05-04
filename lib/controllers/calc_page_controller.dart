import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPageController extends GetxController {
  final Rx<String> _equationFieldText = Rx("");
  final Rx<String> _resultFieldText = Rx("");

  //getters
  String get getEquationFieldText => _equationFieldText.value;
  String get getResultFieldText => _resultFieldText.value;

  //setters
  set _setResultFieldText(String value) {
    final newValue = value.replaceAll(".", ",");
    _resultFieldText.value = newValue;
  }

  String _formatEquation(String equation) {
    final newEquation = equation.replaceAll(",", ".").replaceAll("x", "*");
    return newEquation;
  }

  void _calculate() {
    _setResultFieldText = "";

    try {
      final equation = _formatEquation(_equationFieldText.value);
      final Expression expression = Parser().parse(equation);
      final ContextModel context = ContextModel();

      final result = expression.evaluate(EvaluationType.REAL, context);
      _setResultFieldText = result.toString();
    } catch (e) {
      _setResultFieldText = "";
    }
  }

  void onKeyboardPressed(String key) {
    if (key != "") {
      _equationFieldText.value += key;
      _calculate();
    }
  }

  void clear() {
    _equationFieldText.value = "";
    _setResultFieldText = "";
  }

  void delete() {
    if (_equationFieldText.value.isNotEmpty) {
      final length = _equationFieldText.value.length - 1;
      final text = _equationFieldText.value.substring(0, length);

      _equationFieldText.value = text;
      _calculate();
    }
  }

  void equal() {
    _calculate();
    _equationFieldText.value = _resultFieldText.value;
    _setResultFieldText = "";
  }
}
