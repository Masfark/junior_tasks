import 'package:flutter/material.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/utils/math_example.dart';
import 'package:junior_tasks/widgets/alert_dialog.dart';
import 'package:junior_tasks/widgets/example_card.dart';
import 'package:junior_tasks/widgets/score_life.dart';

class MinusMathPage extends StatefulWidget {
  @override
  _MinusMathPageState createState() => _MinusMathPageState();
}

class _MinusMathPageState extends State<MinusMathPage> {
  int value1, value2, trueAnswer, score = 0, life = 3, range = 10, tmp = 0;
  String answer = '';
  bool check = false;
  var color, _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = '';
    _generateExample(score);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateExample(int score) {
    setState(() {
      if (score == tmp + 250) {
        range += 5;
        tmp = score;
      }
      var list = MathExample.minusExapmle(range);
      value1 = list[0];
      value2 = list[1];
      trueAnswer = list[2];
      answer = '';
    });
  }

  Future<void> _answerCheck(String str) async {
    int i = 0;
    setState(() {
      if (str != '') {
        check = (trueAnswer == int.parse(str));
        answer = str;
        if (check) {
          color = kTrueColor;
          i = 1;
        } else {
          color = kFalseColor;
          i = 2;
        }
        _controller.clear();
        check = true;
      }
    });
    await Future.delayed(Duration(milliseconds: 800));
    if (i == 1) {
      color = Theme.of(context).textTheme.headline6.color;
      _generateExample(score);
      score += 10;
      check = false;
    } else if (i == 2) {
      color = Theme.of(context).textTheme.headline6.color;
      check = false;
      if (life <= 0) {
        showDialog(
            context: context,
            builder: (_) => EndGameDialog(score, _restart),
            barrierDismissible: false);
      } else {
        _generateExample(score);
        life -= 1;
      }
    } else {
      i = 0;
    }
  }

  void _restart() {
    score = 0;
    life = 3;
    tmp = 0;
    range = 10;
    _generateExample(score);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Column(
          children: <Widget>[
            ScoreLife(score, life),
            ExampleCard(
              value1: value1,
              value2: value2,
              answer: answer,
              color: color,
              controller: _controller,
              answerCheck: _answerCheck,
              symbol: '-',
            )
          ],
        ),
      ),
    );
  }
}
