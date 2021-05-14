import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'text_main.dart';

class EndGameDialog extends StatelessWidget {
  final int score;
  final Function restart;

  EndGameDialog(this.score, this.restart);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10.0,
      title: MainText('Игра окончена'),
      content: Text('Вы завершили игру со счетом: $score'),
      actions: [
        MaterialButton(
          onPressed: () {
            // ! Add navigate to main menu
            Navigator.of(context).pop();
          },
          child: Text(
            'Закрыть',
            style: TextStyle(color: Colors.red, fontSize: 16.0),
          ),
        ),
        MaterialButton(
          onPressed: () {
            restart();
            Navigator.of(context).pop();
          },
          child: Text(
            'Заново',
            style: TextStyle(color: kPrimaryColor, fontSize: 16.0),
          ),
        ),
      ],
    );
  }
}
