import 'package:flutter/material.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class ScoreLife extends StatefulWidget {
  final int score, life;

  ScoreLife(this.score, this.life);

  @override
  _ScoreLifeState createState() => _ScoreLifeState();
}

class _ScoreLifeState extends State<ScoreLife> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              MainText(widget.score.toString()),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              MainText(widget.life.toString()),
            ],
          ),
        ],
      ),
    );
  }
}
