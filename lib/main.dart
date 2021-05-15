import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:junior_tasks/assets/theme/theme.dart';
import 'package:junior_tasks/pages/math_example_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: myThemeLight(),
      dark: myThemeDark(),
      initial: AdaptiveThemeMode.system,
      builder: (light, dark) => MaterialApp(
        themeMode: ThemeMode.system,
        darkTheme: dark,
        title: 'Flutter Demo',
        theme: myThemeLight(),
        home: MathExamplePage(),
      ),
    );
  }
}
