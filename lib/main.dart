import 'package:flutter/material.dart';

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
  String display = '';

  void addDigit(String digit) {
    setState(() {
      display = display + digit;
    });
  }

  void clearDigit() {
    setState(() {
      display = '';
    });
  }

  Widget makeButton(String text, void Function() onTap) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onTap,
          child: Text(text),
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
      body: Center(
        child: Column(
          // mainAxisAlignment: .center,

          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: .bottomRight,
                padding: EdgeInsets.all(16),
                child: Text(display, style: TextStyle(fontSize: 48)),
              ),
            ),

            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('C', () { clearDigit(); }),
                  makeButton('+/-', () { addDigit('+/-'); }),
                  makeButton('%', () { addDigit('%'); }),
                  makeButton('÷', () { addDigit('÷'); }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('7', () { addDigit('7'); }),
                  makeButton('8', () { addDigit('8'); }),
                  makeButton('9', () { addDigit('9'); }),
                  makeButton('×', () { addDigit('×'); }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('4', () { addDigit('4'); }),
                  makeButton('5', () { addDigit('5'); }),
                  makeButton('6', () { addDigit('6'); }),
                  makeButton('-', () { addDigit('-'); }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('1', () { addDigit('1'); }),
                  makeButton('2', () { addDigit('2'); }),
                  makeButton('3', () { addDigit('3'); }),
                  makeButton('+', () { addDigit('+'); }),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: .stretch,
                children: [
                  makeButton('0', () { addDigit('0'); }),
                  makeButton('.', () { addDigit('.'); }),
                  makeButton('=', () { addDigit('='); }),
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
