import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _calculate(String operation) {
    setState(() {
      final num1 = double.tryParse(_controller1.text);
      final num2 = double.tryParse(_controller2.text);

      if (num1 == null || num2 == null) {
        _result = 'Please enter valid numbers';
        return;
      }

      switch (operation) {
        case '+':
          _result = (num1 + num2).toString();
          break;
        case '-':
          _result = (num1 - num2).toString();
          break;
        case '*':
          _result = (num1 * num2).toString();
          break;
        case '/':
          if (num2 == 0) {
            _result = 'Cannot divide by zero';
          } else {
            _result = (num1 / num2).toString();
          }
          break;
        default:
          _result = 'Unknown operation';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller1,
              decoration: InputDecoration(labelText: 'Enter first number'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(labelText: 'Enter second number'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
