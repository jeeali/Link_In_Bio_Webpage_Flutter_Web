import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = new ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    textTheme: GoogleFonts.robotoTextTheme().copyWith(
      caption: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
      button: TextStyle(color: Colors.black),
      headline1: TextStyle(color: Colors.black),
      headline2: TextStyle(color: Colors.black),
      headline3: TextStyle(color: Colors.black),
      headline4: TextStyle(color: Colors.black),
      headline5: TextStyle(color: Colors.black),
      headline6: TextStyle(color: Colors.black),
      overline: TextStyle(color: Colors.black),
      subtitle1: TextStyle(color: Colors.black),
      subtitle2: TextStyle(color: Colors.black),
    ),
    backgroundColor: Color(0xffFAFAFA),
    scaffoldBackgroundColor: Color(0xffFAFAFA),
    cardColor: Colors.white);

ThemeData darkTheme = new ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    caption: TextStyle(color: Colors.white),
    bodyText1: TextStyle(color: Colors.white),
    bodyText2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
    headline1: TextStyle(color: Colors.white),
    headline2: TextStyle(color: Colors.white),
    headline3: TextStyle(color: Colors.white),
    headline4: TextStyle(color: Colors.white),
    headline5: TextStyle(color: Colors.white),
    headline6: TextStyle(color: Colors.white),
    overline: TextStyle(color: Colors.white),
    subtitle1: TextStyle(color: Colors.white),
    subtitle2: TextStyle(color: Colors.white),
  ),
  backgroundColor: Color(0xff121212),
  scaffoldBackgroundColor: Color(0xff121212),
  cardColor: Color(0xff1E1E1E),
);
