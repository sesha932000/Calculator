import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:calculater/calculater.dart';

void main() {
  runApp(BasicCalculatorApp());
}

class BasicCalculatorApp extends StatefulWidget {
  @override
  _BasicCalculatorAppState createState() => _BasicCalculatorAppState();
}

class _BasicCalculatorAppState extends State<BasicCalculatorApp> {
  int firstNumber = 0;
  int secondNumber = 0;
  String history = '';
  String textToDisplay = '';
  String result = '';
  String operation = '';

  void btOnClick(String btValue) {
    print("-------------> Button Clicked: Value: " + btValue);

    if (btValue == 'AC') {
      allClear();
    } else if (btValue == '+' ||
        btValue == '-' ||
        btValue == '*' ||
        btValue == '/') {
      basicOperations(btValue);
    } else if (btValue == '=') {
      calculateNumber();
    } else {
      result = int.parse(textToDisplay + btValue).toString();
    }

    setState(() {
      textToDisplay = result;
    });
  }

  void allClear() {
    print("-------------> All Clear");
    firstNumber = 0;
    secondNumber = 0;
    result = '';
    textToDisplay = '';
    history = '';
  }

  void basicOperations(String action) {
    print("-------------> Basic Operations: Action: " + action);
    firstNumber = int.parse(textToDisplay);
    result = '';
    operation = action;
  }

  void calculateNumber() {
    print("-----------> Calculate number: ");

    secondNumber = int.parse(textToDisplay);

    if (operation == '+') {
      result = (firstNumber + secondNumber).toString();
      history = firstNumber.toString() +
          operation.toString() +
          secondNumber.toString();
    } else if (operation == '-') {
      result = (firstNumber - secondNumber).toString();
      history = firstNumber.toString() +
          operation.toString() +
          secondNumber.toString();
    } else if (operation == '*') {
      result = (firstNumber * secondNumber).toString();
      history = firstNumber.toString() +
          operation.toString() +
          secondNumber.toString();
    } else if (operation == '/') {
      result = (firstNumber / secondNumber).toString();
      history = firstNumber.toString() +
          operation.toString() +
          secondNumber.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Calculator',
            ),
          ),
          body: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    history,
                    style: GoogleFonts.rubik(
                        textStyle:
                            TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    textToDisplay,
                    style: GoogleFonts.rubik(
                        textStyle:
                            TextStyle(fontSize: 50, color: Colors.white)),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      text: '7',
                      fillColor: Colors.lightGreenAccent,
                      textColor: Colors.black,
                      textSize: 20,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '8',
                      fillColor: Colors.lightBlue.shade100,
                      textColor: Colors.black,
                      textSize: 20,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '9',
                      fillColor: Colors.deepOrange.shade400,
                      textColor: Colors.black,
                      textSize: 20,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '+',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 20,
                      callback: btOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      text: '4',
                      fillColor: Colors.deepPurple,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '5',
                      fillColor: Colors.yellowAccent,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '6',
                      fillColor: Colors.cyanAccent,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '-',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      text: '1',
                      fillColor: Colors.redAccent,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '2',
                      fillColor: Colors.green,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '3',
                      fillColor: Colors.pinkAccent.shade100,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '*',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorButton(
                      text: '=',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '0',
                      fillColor: Colors.blue,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: 'AC',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                  CalculatorButton(
                      text: '/',
                      fillColor: Colors.white,
                      textColor: Colors.black,
                      textSize: 25,
                      callback: btOnClick),
                ],
              ),
            ],
          )),
          backgroundColor: Colors.black),
    );
  }
}
