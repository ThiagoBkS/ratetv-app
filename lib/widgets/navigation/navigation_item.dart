import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/navigation_item_data.dart';

class NavigationItem extends StatelessWidget {
  final double iconSize = 18;
  final NavigationItemModel item;
  const NavigationItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: ElevatedButton(
        onPressed: item.onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.resolveWith<double>((states) {
            if (states.contains(WidgetState.pressed)) return 0;
            return 0;
          }),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Icon(
              item.icon,
              size: iconSize,
              color: item.active ? Colors.white : Colors.grey,
            ),
            Text(
              item.label,

              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: item.active ? Colors.white : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
