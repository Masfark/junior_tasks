import 'package:flutter/material.dart';
import 'package:junior_tasks/assets/files/records.dart';
import 'package:junior_tasks/pages/Math/main_math_page.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/widgets/text_headline.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map records = Records.mathRecords;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: HeadlineText('Главная'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(color: kSecondaryColor),
                  padding: EdgeInsets.all(25.0),
                  child: HeadlineText(
                    'Меню',
                    textSize: 48.0,
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainMathPage()));
                    });
                  },
                  leading: Icon(
                    Icons.exposure_plus_1,
                    color: kWhite,
                  ),
                  title: MainText(
                    'Математика',
                    color: kWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                title:
                    Text('Количество очков: ' + records[index + 1].toString()),
                subtitle: Text('Место ' + (index + 1).toString()),
              );
            }));
  }
}
