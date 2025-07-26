import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_movie.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/info_row.dart';
import 'package:project_a/widgets/movie_action_button.dart';
import 'package:project_a/widgets/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_avaliable_streamings.dart';
import 'package:project_a/widgets/movie_cast_section.dart';
import 'package:project_a/widgets/movie_header.dart';

class MovieContent extends StatelessWidget {
  final CompleteMovie data;

  const MovieContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          MovieHeader(data: data),
          SizedBox(height: Spacing.medium),
          MovieAvaliableStreamings(data: data),
          SizedBox(height: Spacing.medium),
          MovieActionButtons(
            buttons: [
              MovieActionButton(
                icon: FontAwesomeIcons.check,
                label: "Já Assisti",
              ),
              MovieActionButton(
                icon: FontAwesomeIcons.bookmark,
                label: "Adicionar",
              ),
              MovieActionButton(
                icon: -1 >= 0
                    ? FontAwesomeIcons.solidStar
                    : FontAwesomeIcons.star,

                label: "Avaliar ${-1 + 1}/5",
                iconColor: -1 >= 0 ? Colors.amber : Colors.white,
                // onTap: () {
                //   openRatingModal(context);
                // },
              ),
            ],
          ),
          SizedBox(height: Spacing.medium),
          if (data.cast.isNotEmpty) MovieCastSection(castList: data.cast),
          SizedBox(height: Spacing.medium),
          Divider(color: Colors.grey[800]),
          SizedBox(height: Spacing.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacing.small,
            children: [
              InfoRow(
                title: "Budget:",
                label: TMDBMovie.formattedCurrency(
                  data.movie.budget.toDouble(),
                ),
              ),
              InfoRow(
                title: "Revenue:",
                label: TMDBMovie.formattedCurrency(
                  data.movie.revenue.toDouble(),
                ),
              ),
            ],
          ),
          SizedBox(height: Spacing.medium),
          Text(
            "Todos os dados exibidos nesta aplicação são fornecidos pela API do The Movie Database (TMDb).",
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
