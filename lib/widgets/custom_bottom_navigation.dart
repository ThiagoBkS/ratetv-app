import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/routes/app_routes.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});
  @override
  State<StatefulWidget> createState() {
    return CustomBottomNavigationState();
  }
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int currentPageIndex = 0;

  void updateCurrentPageIndex(int newIndex) {
    setState(() {
      currentPageIndex = newIndex;
    });
  }

  void navigateToPage(List<AppRoute> routes) {
    Navigator.pushReplacementNamed(context, routes[currentPageIndex].path);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      onTap: (index) {
        updateCurrentPageIndex(index);
        navigateToPage(appRoutes);
      },
      items: [
        ...[
          for (final AppRoute route in appRoutes)
            if (route.hideButton != true)
              BottomNavigationBarItem(
                icon: Icon(route.icon),
                label: route.label,
              ),
        ],
      ],
    );
  }
}
