import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {
  var numHours = ' ';
  var hourlyRate = ' ';
  var regPay = '';
  var overPay = '';
  var totalPay = '';
  var tax = '';

  void onCalcPressed() {
    double dbRegPay = 0;
    double dbTotalPay = 0;
    double dbOverPay = 0;
    double dbTax = 0;

    if (isNumeric(numHours) && isNumeric(hourlyRate)) {
        double hours = double.parse(numHours);
        double hourlyR = double.parse(hourlyRate);
        
        if (hours <= 40) {
          dbRegPay = hours * hourlyR;
          dbTotalPay = dbRegPay;
        }
        else {
          dbRegPay = 40 * hourlyR;
          dbOverPay = (hours - 40) * hourlyR * 1.5;
          dbTotalPay = (hours - 40) * hourlyR * 1.5 + 40 * hourlyR;
        }
        dbTax = dbTotalPay * 0.18;
      }

    setState(() {
      if (isNumeric(numHours) && isNumeric(hourlyRate)) {
        regPay = dbRegPay.toString();
        totalPay = dbTotalPay.toString();
        overPay = dbOverPay.toString();
        tax = dbTax.toStringAsFixed(2);
      }
    });
  }

  bool isNumeric(String s) {
    if (s == ' ') {
      return true;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 25),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Number of hours',
              ),
              onChanged: (text) {
                numHours = text;
              },
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            width: 250,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Hourly rate',
              ),
              onChanged: (text) {
                hourlyRate = text;
              },
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            child: Text(
              'Invalid Input',
              style: TextStyle(
                color: (isNumeric(numHours) && isNumeric(hourlyRate)) ? Colors.white : Colors.red
              ),
            ),
          ),
          ElevatedButton(onPressed: onCalcPressed, child: Text('Calculate')),
          SizedBox(height: 25),
          SizedBox(
            width: 350,
            child: Text(
              'Report',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
          ),
          SizedBox(
            height: 200,
            width: 350,
            child: Text(
              'regular pay \$$regPay \novertime pay \$$overPay \ntotal pay \$$totalPay \ntax \$$tax',
              style: const TextStyle(
                fontSize: 20
              ),
            ),
          ),
      ],),
    );
  }
}