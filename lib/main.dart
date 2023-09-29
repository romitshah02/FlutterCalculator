import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Calculator',
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  void buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      output = '0';
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '/' ||
        buttonText == 'x') {
      if (operand.contains('+') ||
          operand.contains('+') ||
          operand.contains('+') ||
          operand.contains('+')) {
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
        operand = buttonText;
      }

      num1 = double.parse(_output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '.') {
      if (_output.contains('.')) {
        return;
      }
      _output = _output + buttonText;
    } else if (buttonText == '=') {
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
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Colors.black),
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        buttonPressed(buttonText);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: const Text('Calculator'),
      ),
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          const Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            child: Text(
              output,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('C'),
                  buildButton('/'),
                  buildButton('+'),
                  buildButton('-'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildButton('x'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('3'),
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('0'),
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildButton('.'),
                  const SizedBox(
                    width: 10,
                  ),
                  buildButton('='),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
