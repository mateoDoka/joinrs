import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JoinrsColorScheme {
  static Color get primaryOrange => const Color(0xffFA4B19);
  static Color get primaryGreen => const Color(0xff0FB491);
  static Color get secondaryPurple => const Color(0xff2D1E46);
  static Color get textSecondary => const Color(0xff6C757D);
  static Color get textMain => const Color(0xff111B23);
  static Color get background => const Color(0xffFFFFFF);
  static Color get border => const Color(0xffE0E0E0);
  static Color get icon => const Color(0xffA1A1A5);
}

class JoinrsTextTheme {
  static Color get secondaryPurple => const Color(0xff2D1E46);
  static TextStyle get headline3 => GoogleFonts.nunito(
        fontSize: 48,
        fontWeight: FontWeight.w800,
        height: 1.2,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get headline4 => GoogleFonts.nunito(
        fontSize: 32,
        fontWeight: FontWeight.w800,
        height: 1.4,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get headline5 => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        height: 1.4,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get headline5Medium => GoogleFonts.nunito(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.3,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get headline6 => GoogleFonts.nunito(
        fontSize: 20,
        height: 1.4,
        letterSpacing: 0.15,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get subtitle1 => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 1.37,
        letterSpacing: 0.15,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get subtitle2 => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w800,
        height: 1.42,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get subtitle2Bold => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.42,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get body1 => GoogleFonts.nunito(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 1,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get body2 => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get button => GoogleFonts.nunito(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        height: 1.33,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get label => GoogleFonts.nunito(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.71,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get caption => GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.4,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );

  static TextStyle get overline => GoogleFonts.nunito(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        height: 1.8,
        letterSpacing: 0.25,
        color: JoinrsColorScheme.textMain,
      );
}
