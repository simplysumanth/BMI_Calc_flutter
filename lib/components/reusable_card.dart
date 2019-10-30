
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget childComponent;
  final Function onPress;

  ReusableCard({@required this.colour, this.childComponent,this.onPress});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPress,
          child: Container(
          height: 200,
          width: 170,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(15),
          ),
          child: childComponent,
        ),
    );
    
  }
}