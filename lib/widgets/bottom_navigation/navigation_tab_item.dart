import 'package:flutter/material.dart';
import 'package:project_a/routes/app_routes.dart';

class NavigationTabItem extends StatelessWidget {
  final AppRoute route;
  const NavigationTabItem({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Expanded(
      child: Material(
        color: Colors.transparent,
        elevation: 0,
        child: InkWell(
          onTap: () {
            if (currentRoute != route.path) {
              Navigator.pushReplacementNamed(context, route.path);
            }
          },

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              Icon(
                route.icon,
                size: 14,
                color: currentRoute == route.path ? Colors.white : Colors.grey,
              ),
              Text(
                route.label,
                style: TextStyle(
                  color: currentRoute == route.path
                      ? Colors.white
                      : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
