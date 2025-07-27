import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/movie_cast.dart';
import 'package:project_a/utils/spacing.dart';
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
          if (cast.isNotEmpty) MovieCastSection(castList: cast),
          SizedBox(height: Spacing.medium),
          Divider(color: Colors.grey[800]),
          SizedBox(height: Spacing.medium),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: Spacing.small,
            children: [
              // InfoRow(title: "Budget:", label: data.movie.budget),
              // InfoRow(title: "Revenue:", label: data.movie.revenue),
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
