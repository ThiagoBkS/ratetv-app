import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// MELHORAR //
class ProfileListCard extends StatelessWidget {
  const ProfileListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4, right: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxHeight: 160),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromRGBO(64, 64, 64, 0.2),
            ),
            child: Row(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    spacing: 4,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Watch Later",
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "A personal list to save movies you want to watch in the future.",
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        spacing: 4,
                        children: [
                          Badge(
                            backgroundColor: Colors.transparent,
                            label: Row(
                              spacing: 8,
                              children: [
                                Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                                Text(
                                  "8.4",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.amber,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double maxWidth = constraints.maxWidth;

                        return Stack(
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..translate(30.0, 5)
                                ..scale(0.9),
                              child: AspectRatio(
                                aspectRatio: 1 / 1.5,
                                child: Opacity(
                                  opacity: 1,
                                  child: SizedBox(
                                    child: ListCardItem(
                                      image:
                                          "https://media.themoviedb.org/t/p/w220_and_h330_face/4VtkIaj76TpQNfhDHXQDdT9uBN5.jpg",
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Transform(
                              transform: Matrix4.identity()
                                ..translate(-30.0, 5)
                                ..scale(0.9),
                              child: AspectRatio(
                                aspectRatio: 1 / 1.5,
                                child: Opacity(
                                  opacity: 1,
                                  child: SizedBox(
                                    child: ListCardItem(
                                      image:
                                          "https://media.themoviedb.org/t/p/w220_and_h330_face/4VtkIaj76TpQNfhDHXQDdT9uBN5.jpg",
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Transform(
                              transform: Matrix4.identity()..translate(15.0, 0),
                              child: AspectRatio(
                                aspectRatio: 1 / 1.5,
                                child: Opacity(
                                  opacity: 1,
                                  child: SizedBox(
                                    child: ListCardItem(
                                      image:
                                          "https://media.themoviedb.org/t/p/w220_and_h330_face/v8ezJI3qfEv4OYq8AWSp4inFIwE.jpg",
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Transform(
                              transform: Matrix4.identity()
                                ..translate(-15.0, 0),
                              child: AspectRatio(
                                aspectRatio: 1 / 1.5,
                                child: Opacity(
                                  opacity: 1,
                                  child: SizedBox(
                                    child: ListCardItem(
                                      image:
                                          "https://media.themoviedb.org/t/p/w220_and_h330_face/4VtkIaj76TpQNfhDHXQDdT9uBN5.jpg",
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Transform.scale(
                              scale: 1.1,
                              child: AspectRatio(
                                aspectRatio: 1 / 1.5,
                                child: SizedBox(
                                  child: ListCardItem(
                                    image:
                                        "https://media.themoviedb.org/t/p/w220_and_h330_face/dw7Tw4EvonhLCso2rzMVe28OYzo.jpg",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListCardItem extends StatelessWidget {
  final String image;

  const ListCardItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(image, fit: BoxFit.cover),
    );
  }
}
