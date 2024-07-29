import 'package:educational_platform/global/utils/color_app.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightThemes = ThemeData.light().copyWith(
    textTheme: TextTheme(
        titleLarge: GoogleFonts.notoKufiArabic(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: ColorManager.firstBlack,
        ),
        titleMedium: GoogleFonts.notoKufiArabic(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: ColorManager.firstBlack,
        ),
        titleSmall: GoogleFonts.notoKufiArabic(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: ColorManager.firstBlack,
        ),
        bodyLarge: GoogleFonts.notoKufiArabic(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: ColorManager.firstBlack,
        ),

        bodySmall: GoogleFonts.notoKufiArabic(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: ColorManager.firstBlack,
        ),





    ));
