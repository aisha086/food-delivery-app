import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme (BuildContext context) => ThemeData(
      fontFamily: GoogleFonts.roboto().fontFamily,
      cardColor: lightIconColor,
      canvasColor: lightCanvasColor,
      primaryColor: lightAppBarColor,
      dividerColor: darkCanvasColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(lightAppBarColor)
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: lightAppBarColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: darkCanvasColor)
      )
  );
  static ThemeData darkTheme (BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.roboto().fontFamily,
      cardColor: darkIconColor,
      canvasColor: darkCanvasColor,
      primaryColor: darkAppBarColor,
      dividerColor: lightCanvasColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(darkAppBarColor)
          )
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: darkAppBarColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: lightCanvasColor)
      )
  );

  static Color lightCanvasColor = const Color(0xffffffff);
  static Color lightCardColor = const Color(0xfff5f5f5);
  static Color lightIconColor = const Color(0xffe37954);
  static Color lightAppBarColor = const Color(0xfff57a82);
  static Color darkCanvasColor = const Color(0xff333333);
  static Color darkContainerColor = const Color(0xff454f59);
  static Color darkIconColor = const Color(0xff27392e);
  static Color darkAppBarColor = const Color(0xff3b5959);

}