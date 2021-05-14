import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final double textSize;
  HeadlineText(this.text, {this.textSize});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(
        '$text',
        style:
            Theme.of(context).textTheme.headline4.copyWith(fontSize: textSize),
      ),
    );
  }
}
