class CalculatorLogic {
  String calculate(String first, String op, String second) {
    String result = '';

    double a = double.parse(first);
    double b = double.parse(second);

    if (op == '×') {
      result = (a * b).toString();
    } else if (op == '÷') {
      if (b == 0) {
        return 'ошибка';
      }
      result = (a / b).toString();
    } else if (op == '-') {
      result = (a - b).toString();
    } else if (op == '+') {
      result = (a + b).toString();
    }

    return result.toString();
  }
}
