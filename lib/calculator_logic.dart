import 'dart:math';

class CalculatorLogic {
  String format(double r) {
    r = double.parse(r.toStringAsFixed(10));
    if (r == r.toInt()) {
      return r.toInt().toString();
    }
    return r.toString();
  }

  String sinDeg(String number) {
    double x = double.parse(number);
    x = x * pi / 180;
    x = sin(x);
    return format(x);
  }

  String cosDeg(String number) {
    double x = double.parse(number);
    x = x * pi / 180;
    x = cos(x);
    return format(x);
  }

  String factorial(String number) {
    double x = double.parse(number);
    if (x != x.toInt() || x < 0 || x > 170) {
      return 'ошибка';
    }
    double r = 1;
    for (int i = 2; i <= x; i++) {
      r = r * i;
    }
    return format(r);
  }

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

    return format(result);
  }
}
