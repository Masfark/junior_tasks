import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  final text;
  final double textSize;
  final Color color;
  MainText(this.text, {this.textSize, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headline1
            .copyWith(fontSize: textSize, color: color),
      ),
    );
  }
}
