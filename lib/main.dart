import 'package:find_out/screens/home_screen.dart';
import 'package:find_out/screens/social_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 13
          ),
          bodyText2: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 11
          ),
          caption: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15
          ),
          headline1: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 47,
            fontWeight: FontWeight.bold
          ),
          headline2: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24
          ),
          headline3: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20
          ),
        )
      ),
    );
  }
}