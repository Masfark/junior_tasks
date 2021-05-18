import 'package:flutter/material.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/widgets/answer_field.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class ExampleCard extends StatelessWidget {
  const ExampleCard({
    Key key,
    @required this.value1,
    @required this.value2,
    @required this.answer,
    @required this.color,
    @required TextEditingController controller,
    @required this.answerCheck,
    @required this.symbol,
  })  : _controller = controller,
        super(key: key);

  final int value1;
  final int value2;
  final String answer, symbol;
  final Color color;
  final TextEditingController _controller;
  final Function answerCheck;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              '$value1 ' + symbol + ' $value2 = $answer',
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
          func: answerCheck,
        ),
        SizedBox(
          height: 25.0,
        ),
        SizedBox(
          width: 175.0,
          height: 40.0,
          child: ElevatedButton.icon(
            onPressed: () {
              answerCheck(_controller.text);
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
    );
  }
}
