import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/media_collection.dart';
import 'package:project_a/widgets/profile_app_bar.dart';
import 'package:project_a/widgets/stat_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "Profile",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        actions: [
          Padding(padding: EdgeInsets.only(right: 8), child: ProfileAppBar()),
        ],
      ),
      body: SafeArea(
        child: Padding(padding: EdgeInsets.all(8), child: ProfileBody()),
      ),
      // bottomNavigationBar: SafeArea(child: BottomNavigation()),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 8,
            children: [
              Column(
                spacing: 4,
                children: [
                  ClipOval(
                    child: Container(
                      height: 104,
                      width: 104,
                      color: Color.fromRGBO(64, 64, 64, 0.5),
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://exemplo.com/imagem.jpg",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            FontAwesomeIcons.solidUser,
                            color: Color.fromRGBO(64, 64, 64, 1),
                            size: 32,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "John Doe",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "@john_doe",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(90, 139, 176, 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.only(
                          top: 4,
                          bottom: 4,
                          left: 12,
                          right: 12,
                        ),
                        child: Row(
                          spacing: 8,
                          children: [
                            Icon(
                              FontAwesomeIcons.heartCircleCheck,
                              size: 14,
                              color: Color.fromRGBO(5, 53, 89, 1),
                            ),
                            Text(
                              "Science Fiction",
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(5, 53, 89, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 6),
              StatContainer(),
              SizedBox(height: 6),
              Divider(height: 2, radius: BorderRadius.circular(32)),
              SizedBox(height: 6),
              MediaCollection(),
              MediaCollection(),
              MediaCollection(),
            ],
          ),
        ),
      ],
    );
  }
}
