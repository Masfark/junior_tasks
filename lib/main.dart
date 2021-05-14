import 'package:flutter/material.dart';
import 'package:junior_tasks/assets/theme/theme.dart';
import 'package:junior_tasks/pages/math_example_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme(),
      home: MathExamplePage(),
    );
  }
}
