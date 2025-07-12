import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Project A",
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: Color.fromRGBO(21, 21, 29, 1),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(21, 21, 29, 1),
        ),
      ),
      home: MoviePage(),
      // routes: {for (final route in appRoutes) route.path: route.builder},
    );
  }
}
