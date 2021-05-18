import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnswerField extends StatelessWidget {
  const AnswerField({
    Key key,
    @required TextEditingController controller,
    @required this.func,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 60.0,
      child: TextField(
        controller: _controller,
        onSubmitted: func,
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
    );
  }
}
