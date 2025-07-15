import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MovieActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (onTap != null) onTap!();
      },
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
