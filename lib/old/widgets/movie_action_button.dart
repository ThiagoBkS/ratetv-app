import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/old/utils/font_size.dart';
import 'package:project_a/old/utils/spacing.dart';

class MovieActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;

  const MovieActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onTap != null) onTap!();
      },
      onLongPress: () {
        if (onTap != null) onTap!();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Spacing.medium)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: Spacing.small,
        children: [
          Icon(icon, color: iconColor, size: 22),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: FontSize.small,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
