import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPress(String buttontext) {
    if (buttontext == 'CLEAR') {
      _output = '0';
      num1 = 0;
      num2 = 0;
      operand = '';
    } else if (buttontext == '+' ||
        buttontext == '-' ||
        buttontext == '/' ||
        buttontext == 'x') {
      num1 = double.parse(output);
      operand = buttontext;
      _output = '0';
    } else if (buttontext == '.') {
      if (_output.contains('.')) {
        print('Already has decimal point');
      } else {
        _output = _output + buttontext;
      }
    } else if (buttontext == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'x') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = '';
    } else {
      _output = _output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget button(String buttonText) {
    return Expanded(
        child: SizedBox(
      height: 70.0,
      child: Padding(
        padding: EdgeInsets.all(2),
        child: OutlinedButton(
          onPressed: () => buttonPress(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    button('7'),
                    button('8'),
                    button('9'),
                    button('/'),
                  ],
                ),
                Row(
                  children: [
                    button('4'),
                    button('5'),
                    button('6'),
                    button('x'),
                  ],
                ),
                Row(
                  children: [
                    button('1'),
                    button('2'),
                    button('3'),
                    button('-'),
                  ],
                ),
                Row(
                  children: [
                    button('.'),
                    button('0'),
                    button('00'),
                    button('+'),
                  ],
                ),
                Row(
                  children: [
                    button('CLEAR'),
                    button('='),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
