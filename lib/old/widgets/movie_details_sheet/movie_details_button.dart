import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const MovieDetailsButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          ),
        ),
        child: Row(
          spacing: 8,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            Text(label, style: GoogleFonts.montserrat(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
