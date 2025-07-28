import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';
import 'package:project_a/utils/spacing.dart';
import 'package:project_a/widgets/movie_page_widgets/info_row.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_action/movie_action_button.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_action/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_cast/movie_cast_section.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_header.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_streaming/movie_avaliable_streamings.dart';

class MovieContent extends StatelessWidget {
  final Movie data;
  final List<MovieCast> cast;

  const MovieContent({super.key, required this.data, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Column(
            spacing: 8,
            children: [
              MovieHeader(data: data),
              MovieAvaliableStreamings(data: data),
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
                  ),
                ],
              ),
              if (cast.isNotEmpty) MovieCastSection(castList: cast),
              Divider(color: Colors.grey[800]),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: Spacing.small,
                children: [
                  InfoRow(title: "Budget:", label: data.budget.toString()),
                  InfoRow(title: "Revenue:", label: data.revenue.toString()),
                ],
              ),
              Text(
                "Todos os dados exibidos nesta aplicação são fornecidos pela API do The Movie Database (TMDb).",
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
