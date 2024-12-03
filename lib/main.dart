import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liki_pro/child/bottomscreen.dart';
//import 'package:liki_pro/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 248, 83, 83)),
        useMaterial3: true,
      ),
      home:BottomPage());
    
  }
}

