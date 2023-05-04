import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_color.dart';

TextTheme responsiveTextTheme(BuildContext cxt) {
  double screenWidth = MediaQuery.of(cxt).size.width;

  // Customize these values to set the base font size for different screen sizes
  double baseFontSize = screenWidth < 600 ? 14 : 16;

  return ThemeData.light().textTheme.copyWith(
    headline1: GoogleFonts.cairo(fontSize: baseFontSize * 1.8,fontWeight: FontWeight.bold,color: blackColor,),
    headline2: GoogleFonts.cairo(fontSize: baseFontSize * 2, color: whiteColor, fontWeight: FontWeight.bold,),
    headline3: GoogleFonts.cairo(fontSize: baseFontSize * 1.75,color: Colors.red,fontWeight: FontWeight.w500,),
    headline4: GoogleFonts.cairo(fontSize: baseFontSize * 1.5,color: orangeColor,fontWeight: FontWeight.w700,decoration: TextDecoration.underline),
    headline5: GoogleFonts.cairo(fontSize: baseFontSize * 1.25,color: blackColor, fontWeight: FontWeight.normal,),
    headline6: GoogleFonts.cairo(fontSize: baseFontSize * 1,color: orangeColor, fontWeight: FontWeight.w500,),
    subtitle1: GoogleFonts.cairo(fontSize: baseFontSize * 0.875,color: whiteGreyColor, fontWeight: FontWeight.w500,),
    subtitle2: GoogleFonts.cairo(fontSize: baseFontSize * 0.99,color: blackColor, fontWeight: FontWeight.w700,),
    bodyText1: GoogleFonts.cairo(fontSize: baseFontSize,color: darkMainColor, fontWeight: FontWeight.w700,),
    bodyText2: GoogleFonts.cairo(fontSize: baseFontSize * 1.3, color: blackColor, fontWeight: FontWeight.w800,),
    button: GoogleFonts.cairo(fontSize: baseFontSize * 1.2,color: whiteColor,fontWeight: FontWeight.w700),
    caption: GoogleFonts.cairo(fontSize: baseFontSize * 1.1,color: greyColor, fontWeight: FontWeight.w400,),
    overline: GoogleFonts.cairo(fontSize: baseFontSize * 0.99, color: greyColor, fontWeight: FontWeight.w400,),
    headlineLarge: GoogleFonts.cairo(fontSize:baseFontSize * 0.625, color: blackColor, fontWeight: FontWeight.normal,),
   // headlineMedium: GoogleFonts.cairo(color: darkMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
    //titleSmall:
  );
}
