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
          operand.contains('-') ||
          operand.contains('/') ||
          operand.contains('x')) {
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
          elevation: 10,
          padding: const EdgeInsets.all(20),
          shape: const CircleBorder(),
          backgroundColor: buttonText == 'C' ? Colors.orange : Colors.black),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: buttonText == 'C' ? Colors.black : Colors.white,
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
        backgroundColor: Colors.black,
        title: const Text('Calculator'),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
            alignment: Alignment.bottomRight,
            child: Text(
              output,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('/'),
                  buildButton('x'),
                  buildButton('-'),
                  buildButton('+'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('9'),
                  buildButton('8'),
                  buildButton('7'),
                  buildButton('6'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('5'),
                  buildButton('4'),
                  buildButton('3'),
                  buildButton('2'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildButton('1'),
                  buildButton('0'),
                  buildButton('.'),
                  buildButton('00'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton('C'),
                  buildButton('='),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
