import 'package:flutter/material.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/utils/math_example.dart';
import 'package:junior_tasks/widgets/alert_dialog.dart';
import 'package:junior_tasks/widgets/answer_field.dart';
import 'package:junior_tasks/widgets/score_life.dart';
import 'package:junior_tasks/widgets/text_headline.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class MathExamplePage extends StatefulWidget {
  @override
  _MathExamplePageState createState() => _MathExamplePageState();
}

class _MathExamplePageState extends State<MathExamplePage> {
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
      var list = MathExample.plusExapmle(range);
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
    return Scaffold(
      appBar: AppBar(
        title: HeadlineText('Math Page'),
      ),
      body: SafeArea(
          child: SizedBox(
        child: Column(
          children: <Widget>[
            ScoreLife(score, life),
            Column(
              children: <Widget>[
                Card(
                  shadowColor: kSecondaryColor,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: kPrimaryColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  elevation: 15,
                  child: Container(
                    alignment: Alignment.center,
                    width: 250,
                    height: 100,
                    child: Text(
                      '$value1 + $value2 = $answer',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: color,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                AnswerField(
                  controller: _controller,
                  func: _answerCheck,
                ),
                SizedBox(
                  height: 25.0,
                ),
                SizedBox(
                  width: 175.0,
                  height: 40.0,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _answerCheck(_controller.text);
                    },
                    label: MainText(
                      'Ответить',
                      textSize: 18.0,
                      color: kWhite,
                    ),
                    icon: Icon(Icons.calculate),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
