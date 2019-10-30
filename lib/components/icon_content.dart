
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;

  IconContent({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100,
          color: Color(0XFFE5E7E9),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          label,
          style: kLabelText,
        )
      ],
    );
  }
}
