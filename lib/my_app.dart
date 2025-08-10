import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/pages/statistics_page.dart';
import 'package:project_a/utils/palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Palette.primaryColor,
            textTheme: GoogleFonts.montserratTextTheme(
              ThemeData(brightness: Brightness.dark).textTheme,
            ),
          ),
          home: StatisticsPage(),
        );
      },
    );
  }
}
