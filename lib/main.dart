import 'package:flutter/material.dart';
import 'calculator_page.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CalculatorPage(),
    );
  }
}