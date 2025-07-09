import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/profile_widgets/profile_backdrop.dart';
import 'package:project_a/widgets/profile_widgets/stat_container.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ProfileBackdrop(),
        Padding(
          padding: EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                SizedBox(
                  child: CircleAvatar(radius: 56, backgroundColor: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  "John Doe",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "@john_doe",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Chip(
                  label: Text(
                    "Science Fiction",
                    style: GoogleFonts.montserrat(fontSize: 12),
                  ),
                  avatar: Icon(FontAwesomeIcons.heartCircleCheck, size: 14),
                ),
                StatContainer(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
