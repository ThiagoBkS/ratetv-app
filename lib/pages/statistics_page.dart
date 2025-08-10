import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:project_a/models/data_label.dart';
import 'package:project_a/models/mounth_data.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/widgets/info_section/info_section.dart';
import 'package:project_a/widgets/mounth_statistics_chart.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  final String username = "Admin";
  final List<DataLabel> details = [
    DataLabel(label: "Gênero favorito", value: "Ficção científica"),
    DataLabel(label: "Filmes assistidos", value: "144"),
    DataLabel(label: "Assistir mais tarde", value: "12"),
    DataLabel(label: "Avaliação média", value: "7.8"),
    DataLabel(label: "Maior avaliação", value: "Interestelar (10)"),
    DataLabel(label: "Menor avaliação", value: "Transformers (3.5)"),
    DataLabel(label: "Filme mais assistido", value: "Superman (4x)"),
  ];

  final List<MounthData> statistics = [
    MounthData('Dez.', 10),
    MounthData('Jan.', 12),
    MounthData('Fev.', 8),
    MounthData('Mar.', 15),
    MounthData('Abr.', 20),
    MounthData('Mai.', 18),
    MounthData('Jun.', 14),
    MounthData('Ago.', 9),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: double.infinity,
                height: constraints.maxHeight,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Column(
                      spacing: 8.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá $username!",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Column(
                              spacing: 4.h,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 4.h,
                                  children: [
                                    Text(
                                      "Filmes assistidos p/ mês",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 18.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Quantidade de filmes assistidos nos últimos 8 meses",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 300,
                                  child: MounthStatisticsChart(
                                    statistics: statistics,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.all(1),
                          width: double.infinity,
                          child: Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(56, 63, 68, 0.25),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Color.fromRGBO(56, 63, 68, 1),
                              ),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 4,
                                    children: [
                                      Text(
                                        "Horas assitindo",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "124h",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    spacing: 4,
                                    children: [
                                      Text(
                                        "Avaliação media",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        spacing: 8,
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.solidStar,
                                            size: 14,
                                            color: Color.fromRGBO(
                                              222,
                                              181,
                                              34,
                                              1,
                                            ),
                                          ),
                                          Text(
                                            NumberFormat(
                                              "#,##0.0",
                                              "pt_BR",
                                            ).format(2.5),
                                            style: GoogleFonts.montserrat(
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InfoSection(title: "Estatísticas", details: details),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text(
                              "Favoritos",
                              style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(5, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 8.r),
                                    child: Stack(
                                      children: [
                                        MovieCard(
                                          enableDetailsSheet: true,
                                          basicMovie: BasicMovie(
                                            isAdult: false,
                                            backdropUrl:
                                                "http://image.tmdb.org/t/p/w500/eU7IfdWq8KQy0oNd4kKXS0QUR08.jpg",
                                            genres: [""],
                                            id: 1061474,
                                            overview:
                                                "Superman, um jovem repórter de Metrópolis, embarca em uma jornada para reconciliar sua herança kryptoniana com sua criação humana como Clark Kent.",
                                            posterUrl:
                                                "https://placehold.co/100x150/EEE/31343C.jpg",
                                            releaseDate: DateTime(0),
                                            title: "Superman",
                                            voteAverage: 7.7,
                                            voteCount: 1622,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                            width: 48,

                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                0,
                                                0,
                                                0,
                                                0.75,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(8),
                                              ),
                                            ),
                                            child: Text(
                                              "${index + 1}",
                                              style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 48,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
