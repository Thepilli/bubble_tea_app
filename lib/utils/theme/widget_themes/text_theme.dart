import 'package:bubble_tea_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 20, color: jPrimaryLightColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, color: jPrimaryLightColor, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.poppins(fontSize: 24, color: jPrimaryLightColor, fontWeight: FontWeight.w700),
    //
    headlineLarge: GoogleFonts.poppins(fontSize: 20, color: jPrimaryLightColor, fontWeight: FontWeight.w600),
    headlineMedium: GoogleFonts.poppins(fontSize: 20, color: jPrimaryLightColor, fontWeight: FontWeight.w600),
    headlineSmall: GoogleFonts.poppins(fontSize: 16, color: jPrimaryLightColor, fontWeight: FontWeight.w600),
    //
    titleLarge: GoogleFonts.poppins(fontSize: 20, color: jPrimaryLightContainerColor, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.montserrat(fontSize: 20, color: jPrimaryLightContainerColor, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.montserrat(fontSize: 16, color: jPrimaryLightColor, fontWeight: FontWeight.w600),
    //
    bodyLarge: GoogleFonts.poppins(fontSize: 20, color: jPrimaryLightColor, fontWeight: FontWeight.w600),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, color: jPrimaryLightColor, fontWeight: FontWeight.w500),
    bodySmall: GoogleFonts.poppins(fontSize: 14, color: jPrimaryLightColor, fontWeight: FontWeight.normal),
    //
    labelLarge: GoogleFonts.poppins(fontSize: 14, color: jPrimaryLightColor, fontWeight: FontWeight.normal),
    labelMedium: GoogleFonts.poppins(fontSize: 16, color: jPrimaryLightColor, fontWeight: FontWeight.w500),
    labelSmall: GoogleFonts.poppins(fontSize: 10, color: jPrimaryLightColor, fontWeight: FontWeight.w700),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: GoogleFonts.montserrat(fontSize: 20, color: jPrimaryDarkColor, fontWeight: FontWeight.bold),
    displayMedium: GoogleFonts.montserrat(fontSize: 24, color: Colors.white60, fontWeight: FontWeight.w700),
    displaySmall: GoogleFonts.montserrat(fontSize: 24, color: Colors.white60, fontWeight: FontWeight.w700),

    //headline
    headlineLarge: GoogleFonts.poppins(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w600),
    //app bar title
    headlineMedium: GoogleFonts.poppins(fontSize: 20, color: Colors.white70, fontWeight: FontWeight.w600),
    //subtitle
    headlineSmall: GoogleFonts.poppins(fontSize: 16, color: Colors.white70, fontWeight: FontWeight.w600),

    ///headline inverse
    titleLarge: GoogleFonts.poppins(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),

    ///app bar title
    titleMedium: GoogleFonts.poppins(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),

    ///subtitle
    titleSmall: GoogleFonts.montserrat(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w600),

    bodyLarge: GoogleFonts.poppins(fontSize: 20, color: Colors.white60, fontWeight: FontWeight.w500),
    bodyMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.white60, fontWeight: FontWeight.w300),
    bodySmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white60, fontWeight: FontWeight.normal),

    // aka tile
    labelLarge: GoogleFonts.poppins(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.normal),
    // aka button
    labelMedium: GoogleFonts.poppins(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),
    // aka buttonInverse
    labelSmall: GoogleFonts.poppins(fontSize: 10, color: Colors.white70, fontWeight: FontWeight.w700),
  );
}

// Text(jProfile, style: Theme.of(context).textTheme.headlineLarge),
// Text(jProfile, style: Theme.of(context).textTheme.headlineMedium),
// Text(jProfile, style: Theme.of(context).textTheme.headlineLarge),
// Text(jProfile, style: Theme.of(context).textTheme.headlineMedium),
