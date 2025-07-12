import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/widgets/bottom_navigation.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_backdrop.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_card.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_genre_chip.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(pageIndex: 0),
      body: SafeArea(child: MoviePageBody()),
    );
  }
}

class MoviePageBody extends StatelessWidget {
  const MoviePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            MovieBackdrop(image: "https://placehold.co/100x150/EEE/31343C.jpg"),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                children: [
                  SizedBox(height: 48),
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        Expanded(
                          flex: 2,
                          child: MovieCard(
                            image:
                                "https://placehold.co/100x150/EEE/31343C.jpg",
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: Colors.transparent,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 4,
                              children: [
                                Text(
                                  'Lorem Ipsum',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 4,
                                  children: [
                                    Text(
                                      '2025',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text("•"),
                                    Text(
                                      '2h 59m',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text("•"),
                                    Text(
                                      '14',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  spacing: 8,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.solidStar,
                                      size: 14,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      '8.7/10',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      '(127k)',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    MovieGenreChip(label: "Ficção Científica"),
                                    MovieGenreChip(label: "Aventura"),
                                    MovieGenreChip(label: "Ação"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse lectus erat, maximus non pulvinar et, venenatis eget turpis. Morbi scelerisque elementum volutpat. Donec varius.',
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),

                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(
                              158,
                              158,
                              158,
                              0.1,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: Icon(LucideIcons.eye, color: Colors.white),
                          label: Text(
                            "Watched",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(
                              158,
                              158,
                              158,
                              0.1,
                            ),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          icon: Icon(LucideIcons.plus, color: Colors.white),
                          label: Text(
                            "Add to List",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Text("Where I Watch?"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 8,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 48,
                          width: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.red),
                          child: Image.network(
                            "https://placehold.co/50x50/EEE/31343C.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 48,
                          width: 48,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.red),
                          child: Image.network(
                            "https://placehold.co/50x50/EEE/31343C.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
