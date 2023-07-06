import 'package:flutter/material.dart';

import '../models/model.dart';

class CalculatorView extends StatefulWidget {
  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 1',
              ),
            ),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number 2',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                int number1 = int.tryParse(number1Controller.text) ?? 0;
                int number2 = int.tryParse(number2Controller.text) ?? 0;
                int result = number1 + number2;

                setState(() {
                  CalculatorModel calculatorModel = CalculatorModel(
                    number1: number1,
                    number2: number2,
                    result: result,
                  );
                  _showResultDialog(calculatorModel);
                });
              },
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }

  void _showResultDialog(CalculatorModel calculatorModel) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Result'),
          content: Text(
            'Result: ${calculatorModel.result}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
