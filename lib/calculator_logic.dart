class CalculatorLogic {
  String calculate(String first, String op, String second) {
    double result = 0;

    if (first == '' || op == '' || second == '') {
      return '';
    }

    double a = double.parse(first);
    double b = double.parse(second);

    if (op == '×') {
      result = (a * b);
    } else if (op == '÷') {
      if (b == 0) {
        return 'ошибка';
      }
      result = (a / b);
    } else if (op == '-') {
      result = (a - b);
    } else if (op == '+') {
      result = (a + b);
    }

    if (result == result.toInt()) {
      return result.toInt().toString();
    }

    return result.toString();
  }
}
