import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junior_tasks/pages/Math/minus_math_page.dart';
import 'package:junior_tasks/pages/Math/plus_math_page.dart';
import 'package:junior_tasks/widgets/text_headline.dart';

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
          title: HeadlineText('Математика'),
          bottom: TabBar(
            indicatorWeight: 4.0,
            unselectedLabelColor: Colors.white38,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.exposure_plus_1,
                    ),
                    Text(
                      ' Сложение',
                      style: GoogleFonts.lobster(fontSize: 18.0),
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
                    ),
                    Text(
                      ' Вычитание',
                      style: GoogleFonts.lobster(fontSize: 18.0),
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
