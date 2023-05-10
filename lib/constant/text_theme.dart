import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'const_color.dart';

TextTheme responsiveTextTheme(BuildContext cxt) {
  Size screenWidth = MediaQuery.of(cxt).size;

  // Customize these values to set the base font size for different screen sizes
  double baseFontSize = screenWidth.width < 600 ? 14 : 16;

  return ThemeData.light().textTheme.copyWith(
    displayLarge: GoogleFonts.cairo(fontSize: baseFontSize * 1.8,fontWeight: FontWeight.bold,color: blackColor,height:1.3),
    displayMedium: GoogleFonts.cairo(fontSize: baseFontSize * 2, color: whiteColor, fontWeight: FontWeight.bold,height: 1.3),
    displaySmall: GoogleFonts.cairo(fontSize: baseFontSize * 1.75,color: Colors.red,fontWeight: FontWeight.w500,height: 1),
    headlineMedium: GoogleFonts.cairo(fontSize: baseFontSize * 1.5,color: orangeColor,fontWeight: FontWeight.w700,decoration: TextDecoration.underline),
    headlineSmall: GoogleFonts.cairo(fontSize: baseFontSize * 1.25,color: blackColor, fontWeight: FontWeight.normal,),
    titleLarge: GoogleFonts.cairo(fontSize: baseFontSize * 1.2,color: orangeColor, fontWeight: FontWeight.w500,),
    titleMedium: GoogleFonts.cairo(fontSize: baseFontSize * 0.875,color: whiteGreyColor, fontWeight: FontWeight.w500,),
    titleSmall: GoogleFonts.cairo(fontSize: baseFontSize * 0.99,color: blackColor, fontWeight: FontWeight.w700,),
    bodyLarge: GoogleFonts.cairo(fontSize: baseFontSize,color: darkMainColor, fontWeight: FontWeight.w700,),
    labelLarge: GoogleFonts.cairo(fontSize: baseFontSize * 1.2,color: whiteColor,fontWeight: FontWeight.w700),
    bodyMedium: GoogleFonts.cairo(fontSize: baseFontSize * 1.3, color: blackColor, fontWeight: FontWeight.w800,),
    bodySmall: GoogleFonts.cairo(fontSize: baseFontSize * 1.1,color: greyColor, fontWeight: FontWeight.w400,),
    labelSmall: GoogleFonts.cairo(fontSize: baseFontSize * 0.99, color: greyColor, fontWeight: FontWeight.w400,),
    headlineLarge: GoogleFonts.cairo(fontSize:baseFontSize * 0.625, color: blackColor, fontWeight: FontWeight.normal,),
  labelMedium: GoogleFonts.cairo(fontSize: baseFontSize * 1.1,color: whiteColor, fontWeight: FontWeight.w400,),
  // bodySmall: GoogleFonts.cairo(fontSize: baseFontSize * 0.875,color: whiteColor,fontWeight: FontWeight.normal),
   // headlineSmall:GoogleFonts.cairo(fontSize: baseFontSize * 0.875,color: whiteColor,fontWeight: FontWeight.normal),
   // headlineMedium: GoogleFonts.cairo(color: darkMainColor,decoration: TextDecoration.underline,fontWeight: FontWeight.bold),
    //titleSmall:
  );
}