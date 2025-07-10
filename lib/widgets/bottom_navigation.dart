import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/routes/app_routes.dart';

class BottomNavigation extends StatefulWidget {
  final int pageIndex;

  const BottomNavigation({super.key, required this.pageIndex});

  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigation> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          currentPageIndex = index;
        });

        Navigator.pushReplacementNamed(
          context,
          appRoutes[currentPageIndex].path,
        );
      },
      currentIndex: currentPageIndex,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
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
