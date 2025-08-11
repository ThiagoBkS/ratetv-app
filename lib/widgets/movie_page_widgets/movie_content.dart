import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/models/production/movie_production.dart';
import 'package:project_a/models/production/origin_country.dart';
import 'package:project_a/models/tmdb_models/movie.dart';
import 'package:project_a/models/tmdb_models/movie_cast.dart';
import 'package:project_a/service/rate_tv_service.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/utils/palette.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_action/movie_action_button.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_action/movie_action_buttons.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_cast/movie_cast_section.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_header.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_streaming/movie_avaliable_streamings.dart';
import 'package:project_a/widgets/movie_page_widgets/production_details/movie_production_details.dart';

class MovieContent extends StatelessWidget {
  final Movie data;
  final List<MovieCast> cast;

  const MovieContent({super.key, required this.data, required this.cast});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 8,
            children: [
              MovieHeader(data: data),
              MovieActionButtons(
                buttons: [
                  MovieActionButton(
                    icon: FontAwesomeIcons.check,
                    label: "Já Assisti",
                    onTap: () {
                      try {
                        RateTvService.sendWatchedMovie(data.id);
                      } catch (err) {}
                      ;
                    },
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
              MovieAvaliableStreamings(data: data),
              SizedBox(height: 16),
              MovieCastSection(castList: cast),
              Divider(color: Palette.placeholderColor),

              MovieProductionDetails(
                production: MovieProduction(
                  originalTitle: data.originalTitle,
                  originCountry: [OriginCountry(name: "US")],
                  budget: data.budget,
                  revenue: data.revenue,
                  productionCompanies: data.productionCompanies,
                  productionCountry: data.productionCountry,
                ),
              ),
              Text(
                "Todos os dados exibidos nesta aplicação são fornecidos pela API do The Movie Database (TMDb).",
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
