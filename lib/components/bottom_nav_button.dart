import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButtom extends StatelessWidget {
  
  final Function onTap;
  final String text;
  final Function calculate;

  BottomButtom({this.onTap,this.text,this.calculate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: bottomContainerHeight,
        color: containerColor,
        child: Center(
          child: Text(
           text,
            style: kLabelText,
          ),
        ),
      ),
    );
  }
}