import 'package:flutter/material.dart';
import 'package:project_a/pages/movie_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromRGBO(24, 28, 31, 1),
      ),

      home: MoviePage(),
    );
  }
}
