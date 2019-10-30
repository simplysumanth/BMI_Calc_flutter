import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0XFF0C5163),
        accentColor: Color(0XFFDAE5E9),
        scaffoldBackgroundColor: Color(0XFF045066),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0XFFDAE5E9),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => InputPage(),
        '/results': (context) => ResultsPage(),
      },
    );
  }
}



