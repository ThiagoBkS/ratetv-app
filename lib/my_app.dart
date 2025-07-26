import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/pages/main_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(24, 28, 31, 1),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(24, 28, 31, 1),
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.white, // Cor padrão do texto
          displayColor: Colors.white, // Cor para títulos
        ),
      ),
      themeMode: ThemeMode.dark,
      home: MainPage(),
    );
  }
}
