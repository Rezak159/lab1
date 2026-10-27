import 'package:flutter/material.dart';

import 'calculator_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(
          seedColor: const Color.fromARGB(255, 183, 58, 114),
        ),
      ),
      home: const MyHomePage(title: 'Калькулятор 2.0'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String first = '';
  String op = '';
  String second = '';

  CalculatorLogic logic = CalculatorLogic();
  String result = '';

  void addDigit(String digit) {
    setState(() {
      if (result != '') {
        clearDigit();
      }
      if (op == '') {
        if (first.length > 16) {
          return;
        }
        if (first.contains('.') && digit == '.') {
          return;
        }
        if (first == '' && digit == '.') {
          first = '0';
        }
        first = first + digit;
      } else {
        if (second.length > 16) {
          return;
        }
        if (second.contains('.') && digit == '.') {
          return;
        }
        if (second == '' && digit == '.') {
          second = '0';
        }
        second = second + digit;
      }
    });
  }

  void addOp(String o) {
    setState(() {
      if (first == '') {
        return;
      }
      if (result == 'ошибка') {
        clearDigit();
        return;
      }
      if (result != '') {
        first = result;
        second = '';
        result = '';
      }
      op = o;
    });
  }

  void changeSign() {
    setState(() {
      if (result != '') {
        return;
      }
      if (op == '' && first.isNotEmpty) {
        if (first.startsWith('-')) {
          first = first.substring(1);
        } else {
          first = '-' + first;
        }
      } else if (op.isNotEmpty && second.isNotEmpty) {
        if (second.startsWith('-')) {
          second = second.substring(1);
        } else {
          second = '-' + second;
        }
      }
    });
  }

  void applyFunc(String f) {
    setState(() {
      if (result == 'ошибка') {
        return;
      }
      if (result != '') {
        first = result;
        op = '';
        second = '';
        result = '';
      }

      String number = '';
      if (op == '') {
        number = first;
      } else {
        number = second;
      }
      if (number == '') {
        return;
      }

      String answer = '';
      if (f == 'sin') {
        answer = logic.sinDeg(number);
      } else if (f == 'cos') {
        answer = logic.cosDeg(number);
      } else if (f == '!') {
        answer = logic.factorial(number);
      }

      if (answer == 'ошибка') {
        result = answer;
        return;
      }

      if (op == '') {
        first = answer;
      } else {
        second = answer;
      }
    });
  }

  void clearDigit() {
    setState(() {
      first = '';
      op = '';
      second = '';
      result = '';
    });
  }

  void equals() {
    setState(() {
      result = logic.calculate(first, op, second);
    });
  }

  Widget makeButton(
    String text,
    void Function() onTap, {
    Color color = const Color.fromARGB(255, 240, 240, 240),
    Color textColor = Colors.black,
  }) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
          ),
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: .center,

          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: .bottomRight,
                padding: EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: .end,
                  mainAxisAlignment: .end,
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: .centerRight,
                        child: Text(
                          first + op + second,
                          style: TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: .centerRight,
                        child: Text(result, style: TextStyle(fontSize: 48)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('sin', () {
                    applyFunc('sin');
                  }, color: Colors.grey.shade400),
                  makeButton('cos', () {
                    applyFunc('cos');
                  }, color: Colors.grey.shade400),
                  makeButton('n!', () {
                    applyFunc('!');
                  }, color: Colors.grey.shade400),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('C', () {
                    clearDigit();
                  }, color: Colors.grey.shade400),
                  makeButton('+/-', () {
                    changeSign();
                  }, color: Colors.grey.shade400),
                  makeButton(
                    '÷',
                    () {
                      addOp('÷');
                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('7', () {
                    addDigit('7');
                  }),
                  makeButton('8', () {
                    addDigit('8');
                  }),
                  makeButton('9', () {
                    addDigit('9');
                  }),
                  makeButton(
                    '×',
                    () {
                      addOp('×');
                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('4', () {
                    addDigit('4');
                  }),
                  makeButton('5', () {
                    addDigit('5');
                  }),
                  makeButton('6', () {
                    addDigit('6');
                  }),
                  makeButton(
                    '-',
                    () {
                      addOp('-');
                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('1', () {
                    addDigit('1');
                  }),
                  makeButton('2', () {
                    addDigit('2');
                  }),
                  makeButton('3', () {
                    addDigit('3');
                  }),
                  makeButton(
                    '+',
                    () {
                      addOp('+');
                    },
                    color: Colors.orange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('0', () {
                    addDigit('0');
                  }),
                  makeButton('.', () {
                    addDigit('.');
                  }),
                  makeButton(
                    '=',
                    () {
                      equals();
                    },
                    color: Colors.deepOrange,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
          //
        ),
      ),
    );
  }
}
