import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData iconData;
  final Function calc;
  RoundButton({this.iconData, this.calc});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        calc();
      },
      elevation: 10.0,
      child: Icon(iconData),
      shape: CircleBorder(),
      fillColor: Color(0XFF0C5163),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}