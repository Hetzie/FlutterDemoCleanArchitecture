import 'package:flutter/material.dart';

ThemeData themeData() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Mulish',
      appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
 return const AppBarTheme(
   color: Colors.white,
   elevation: 0,
   centerTitle: true,
   iconTheme: IconThemeData(color: Color(0x8b8b8b)),
   titleTextStyle: TextStyle(color: Color(0x8b8b8b), fontSize: 18)
 );
}
