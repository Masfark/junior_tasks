import 'package:flutter/material.dart';
import 'package:junior_tasks/pages/Math/minus_math_page.dart';
import 'package:junior_tasks/pages/Math/plus_math_page.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:junior_tasks/widgets/text_headline.dart';
import 'package:junior_tasks/widgets/text_main.dart';

class MainMathPage extends StatefulWidget {
  @override
  _MainMathPageState createState() => _MainMathPageState();
}

class _MainMathPageState extends State<MainMathPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: HeadlineText('Math Page'),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exposure_plus_1,
                      color: kWhite,
                    ),
                    MainText(
                      ' Сложение',
                      color: kWhite,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exposure_minus_1,
                      color: kWhite,
                    ),
                    MainText(
                      ' Вычитание',
                      color: kWhite,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            PlusMathPage(),
            MinusMathPage(),
          ],
        ));
  }
}
