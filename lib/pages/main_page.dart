import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/routes/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  final List<AppRoute> _pages = appRoutes;
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            // Garantir que em _pages tenha o index da pagina;
            _currentPageIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        elevation: 0,
        items: [
          for (AppRoute page in _pages)
            if (page.hidden != true)
              BottomNavigationBarItem(
                icon: Icon(page.icon),
                label: page.label,
                backgroundColor: Colors.transparent,
              ),
        ],
      ),
      body: SafeArea(child: _pages[_currentPageIndex].builder(context)),
    );
  }
}
