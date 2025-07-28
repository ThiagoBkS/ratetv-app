import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';
import 'package:project_a/utils/font_size.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_cast/movie_cast_card.dart';

class MovieCastSection extends StatelessWidget {
  final List<MovieCast> castList;
  const MovieCastSection({super.key, required this.castList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: Spacing.extraSmall,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 4,
              children: [
                Text(
                  "Elenco",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: FontSize.large,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("(${castList.length})"),
              ],
            ),
          ],
        ),

        castList.isEmpty
            ? Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Text("Nenhum elenco disponível"),
                ),
              )
            : SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(castList.length, (index) {
                    MovieCast cast = castList[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: MovieCastCard(cast: cast),
                    );
                  }),
                ),
              ),
      ],
    );
  }
}

// Column(
//       spacing: 8,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [

//         ),
//       ],
//     );
//   }
