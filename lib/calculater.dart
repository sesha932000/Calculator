import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;

  final fillColor;
  final textColor;
  final double textSize;
  final Function callback;

  const CalculatorButton(
      {required this.text,
      this.fillColor,
      this.textColor,
      required this.textSize,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: SizedBox(
          width: 70,
          height: 70,
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              text,
              style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                fontSize: textSize,
              )),
            ),
            onPressed: () => callback(text),
            color: fillColor,
            textColor: textColor,
          )),
    );
  }
}
