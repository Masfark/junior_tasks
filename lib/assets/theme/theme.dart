import 'package:flutter/material.dart';
import 'package:junior_tasks/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData myThemeLight() => ThemeData(
      // * Main clors theme
      brightness: Brightness.light,
      primaryColor: kPrimaryColor,
      accentColor: kSecondaryColor,

      // * Text theme
      textTheme: TextTheme(
        headline1: GoogleFonts.lobster(fontSize: 18.0, color: kPrimaryColor),
        headline2: GoogleFonts.lobster(fontSize: 20.0),
        headline6: GoogleFonts.lobster(fontSize: 48.0, color: kPrimaryColor),
        headline4: GoogleFonts.lobster(fontSize: 24.0, color: kWhite),
      ),

      // * Icons theme
      primaryIconTheme: IconThemeData(color: kWhite),

      // * Elevated button style
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10.0),
          shadowColor: MaterialStateProperty.all(kSecondaryColor),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),

      // * Floating Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
      ),
    );

ThemeData myThemeDark() => ThemeData(
      // * Main clors theme
      brightness: Brightness.dark,
      primaryColor: kPrimaryColor,
      accentColor: kSecondaryColor,

      // * Text theme
      textTheme: TextTheme(
        headline1: GoogleFonts.lobster(fontSize: 18.0, color: kSecondaryColor),
        headline6: GoogleFonts.lobster(fontSize: 48.0, color: kSecondaryColor),
        headline4: GoogleFonts.lobster(fontSize: 24.0, color: kWhite),
      ),

      // * Icons theme
      primaryIconTheme: IconThemeData(color: kWhite),

      // * Elevated button style
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10.0),
          shadowColor: MaterialStateProperty.all(kSecondaryColor),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),

      // * Floating Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: kSecondaryColor,
        foregroundColor: Colors.white,
      ),
    );
