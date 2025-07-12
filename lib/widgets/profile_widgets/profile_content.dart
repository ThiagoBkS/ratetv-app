import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/user_profile.dart';
import 'package:project_a/widgets/profile_widgets/profile_avatar.dart';
import 'package:project_a/widgets/profile_widgets/profile_backdrop.dart';
import 'package:project_a/widgets/profile_widgets/stat_container.dart';

class ProfileContent extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileContent({super.key, required this.userProfile});

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
              spacing: 8,
              children: [
                ProfileAvatar(avatarUrl: userProfile.avatarUrl),
                Column(
                  children: [
                    Text(
                      userProfile.name,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      userProfile.username,
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Chip(
                  label: Text(
                    "Science Fiction",
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.grey[100],
                    ),
                  ),
                  avatar: Icon(
                    FontAwesomeIcons.heartCircleCheck,
                    size: 14,
                    color: Colors.grey[100],
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                StatContainer(stats: userProfile.stats),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
