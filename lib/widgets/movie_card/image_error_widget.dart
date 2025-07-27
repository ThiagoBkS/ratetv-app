import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/utils/utils.dart';

class ImageErrorWidget extends StatelessWidget {
  final String label;
  const ImageErrorWidget({super.key, this.label = "Sem título"});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      color: Color.fromRGBO(56, 63, 68, 1),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = (constraints.maxWidth / 12).clamp(12.0, 32.0);

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 8,
              children: [
                Icon(
                  LucideIcons.imageOff300,
                  color: Color.fromRGBO(82, 91, 97, 1),
                  size: valueOfPercentage(constraints.maxWidth, 0.35),
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.montserrat(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(82, 91, 97, 1),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
