import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/profile_avatar.dart';
import 'package:project_a/widgets/profile_backdrop.dart';
import 'package:project_a/widgets/profile_list_card.dart';
import 'package:project_a/widgets/profile_stat_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            ProfileBackdrop(
              image: "https://placehold.co/192x108/EEE/31343C.jpg",
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    ProfileAvatar(
                      avatarUrl: "https://placehold.co/64/EEE/31343C.jpg",
                    ),
                    Column(
                      children: [
                        Text(
                          "teste",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "@test",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Chip(
                      label: Text(
                        "teste",
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
                    ProfileStatContainer(),
                    ProfileListCard(),
                    ProfileListCard(),
                    ProfileListCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
