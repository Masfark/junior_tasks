import 'package:flutter/material.dart';
import 'package:junior_tasks/widgets/text_headline.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineText('Home Page'),
      ),
      // ! Score table ?
    );
  }
}
