import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String _display = "0";
  String _input = "";
  double num1 = 0;
  double num2 = 0;
  String operator = "";

  void _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _input = "";
        num1 = 0;
        num2 = 0;
        operator = "";
        _display = "0";
      } else if (value == "+" || value == "-" || value == "×" || value == "÷") {
        if (_input.isNotEmpty) {
          num1 = double.parse(_input);
          operator = value;
          _input = "";
        }
      } else if (value == "=") {
        if (_input.isNotEmpty && operator.isNotEmpty) {
          num2 = double.parse(_input);
          double result = 0;
          if (operator == "+") result = num1 + num2;
          else if (operator == "-") result = num1 - num2;
          else if (operator == "×") result = num1 * num2;
          else if (operator == "÷") result = num2 != 0 ? num1 / num2 : 0;

          _display = result.toString();
          _input = result.toString();
          operator = "";
          num1 = 0;
          num2 = 0;
        }
      } else {
        _input += value;
        _display = _input;
      }
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ElevatedButton(
          onPressed: () => _onPressed(text),
          child: Text(text, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Basic Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(
                _display,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: [
              Row(children: [_buildButton("7"), _buildButton("8"), _buildButton("9"), _buildButton("÷")]),
              Row(children: [_buildButton("4"), _buildButton("5"), _buildButton("6"), _buildButton("×")]),
              Row(children: [_buildButton("1"), _buildButton("2"), _buildButton("3"), _buildButton("-")]),
              Row(children: [_buildButton("0"), _buildButton("C"), _buildButton("="), _buildButton("+")]),
            ],
          ),
        ],
      ),
    );
  }
}