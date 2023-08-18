import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talkr_chat_app/core/constant/constants.dart';

import '../text_theme.dart';

class TextThemeLight implements ITextTheme {
  @override
  late final TextTheme data;

  @override
  TextStyle? bodyText1;

  @override
  TextStyle? bodyText2;

  @override
  TextStyle? headline1;

  @override
  TextStyle? headline3;

  @override
  TextStyle? headline4;

  @override
  TextStyle? headline5;

  @override
  TextStyle? headline6;

  @override
  TextStyle? subtitle1;

  @override
  TextStyle? subtitle2;
  @override
  final Color? primaryColor;

  TextThemeLight(this.primaryColor) {
    data = TextTheme(
      bodyMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w500, fontSize: 13, color: whiteAccentColor),
      bodySmall: GoogleFonts.nunito(
          fontWeight: FontWeight.w500, fontSize: 14, color: whiteAccentColor),
      titleLarge: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      titleMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w400, color: whiteAccentColor),
      headlineMedium: GoogleFonts.nunito(
          fontWeight: FontWeight.w700, fontSize: 14, color: Colors.black),
    ).apply();
    fontFamily = GoogleFonts.nunito().fontFamily;
  }

  @override
  String? fontFamily;
}
