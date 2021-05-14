import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/utils/math_example.dart';
import 'package:junior_tasks/widgets/score_life.dart';
import 'package:junior_tasks/widgets/text_headline.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class MathExamplePage extends StatefulWidget {
  @override
  _MathExamplePageState createState() => _MathExamplePageState();
}

class _MathExamplePageState extends State<MathExamplePage> {
  int value1, value2, trueAnswer, score = 0, life = 3;
  String answer = '';
  bool check = false;
  var color = kPrimaryColor, _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = '';
    _generateExample();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _generateExample() {
    setState(() {
      var list = MathExample.plusExapmle(10);
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
      color = kPrimaryColor;
      _generateExample();
      score += 10;
      check = false;
    } else if (i == 2) {
      color = kPrimaryColor;
      _generateExample();
      life -= 1;
      check = false;
    } else {
      i = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeadlineText('Math Page'),
      ),
      body: SafeArea(
          child: Expanded(
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
                Container(
                  width: 110.0,
                  height: 60.0,
                  child: TextField(
                    controller: _controller,
                    onSubmitted: _answerCheck,
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          fontSize: 26.0,
                        ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0.0),
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        iconSize: 18.0,
                        alignment: Alignment.center,
                        onPressed: () {
                          _controller.clear();
                        },
                        icon: Icon(Icons.clear),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3),
                    ],
                  ),
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
