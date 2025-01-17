import 'package:google_fonts/google_fonts.dart';
import 'package:AIApp/ext/color_ext.dart';
import 'package:AIApp/api/api.dart';


import 'package:flutter/material.dart';

import 'settings.dart';

class C {
  static const back = Color.fromARGB(255, 226, 112, 112);
  static const white = Color.fromARGB(255, 101, 58, 58);
  static const black = Colors.black;
  static const front = Color(0xff6C36FF);
  static const header = Color(0xffE2E2E2);
  static const grey = Color(0xFF444444);
  static const grey2 = Color(0xFFF2F2F2);
  static const grey3 = Color(0xFF9A9A9A);
  static const grey4 = Color(0xFFE9E9E9);
  static const grey5 = Color.fromARGB(255, 228, 228, 228);
  static const grey6 = Color.fromARGB(255, 58, 58, 58);
  static const grey7 = Color.fromARGB(255, 245, 245, 245);
  static const purple = Color(0xFF550879);
  static const borderGrey = Color(0x19000000);
}

final theme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: C.back,
  primarySwatch: C.front.material,
  fontFamily: GoogleFonts.inter().fontFamily,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.all(M.small),
        side: const BorderSide(color: C.front, width: 1),
        textStyle: const TextStyle(fontSize: 16, color: C.front),
        foregroundColor: C.back,
        backgroundColor: C.white),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        padding: const EdgeInsets.all(M.normal),
        side: const BorderSide(color: C.front, width: 1),
        textStyle: const TextStyle(
            fontSize: 16, color: C.front, fontWeight: FontWeight.w700),
        foregroundColor: C.front,
        backgroundColor: C.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFC6C6C6),
        width: 1,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Color(0xFFC6C6C6),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: C.front,
        width: 2,
      ),
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
        fontSize: 18,
        height: 1.4202273233,
        fontWeight: FontWeight.normal,
        color: C.black),
    bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.2125,
        fontWeight: FontWeight.w600,
        color: C.front),
    bodySmall: TextStyle(
        fontSize: 14,
        height: 17 / 14,
        fontWeight: FontWeight.w400,
        color: C.black),
    titleMedium: TextStyle(
        fontSize: 16,
        height: 1.2125,
        fontWeight: FontWeight.w700,
        color: C.black),
    titleLarge: TextStyle(
        fontSize: 24,
        height: 28 / 24,
        fontWeight: FontWeight.w700,
        color: C.black),
    titleSmall: TextStyle(
        fontSize: 18, height: 1, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 103, 97, 120)),
    displayLarge: TextStyle(
        fontSize: 24,
        height: 32 / 29,
        fontWeight: FontWeight.w500,
        color: Colors.black),
    displaySmall: TextStyle(
        fontSize: 14,
        height: 17 / 14,
        fontWeight: FontWeight.normal,
        color: C.front,
        fontStyle: FontStyle.italic),
    labelMedium: TextStyle(
        fontSize: 12, height: 1, fontWeight: FontWeight.w400, color: C.grey3),
    labelSmall: TextStyle(
        fontSize: 10, height: 1, fontWeight: FontWeight.w600, color: C.grey3),
    displayMedium: TextStyle(
        fontSize: 14,
        height: 17 / 14,
        fontWeight: FontWeight.w400,
        color: C.front),
  ),
);
