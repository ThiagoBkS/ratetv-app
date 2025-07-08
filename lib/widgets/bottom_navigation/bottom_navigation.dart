import 'package:flutter/material.dart';
import 'package:project_a/routes/app_routes.dart';
import 'package:project_a/widgets/bottom_navigation/navigation_tab_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        color: Color.fromRGBO(30, 31, 36, 1),
        border: BoxBorder.fromLTRB(
          top: BorderSide(color: Color.fromRGBO(48, 48, 67, 0.5), width: 2),
          left: BorderSide(color: Color.fromRGBO(48, 48, 67, 0.5), width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final route in appRoutes) NavigationTabItem(route: route),
        ],
      ),
    );
  }
}
