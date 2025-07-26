import 'package:project_a/models/parser/basic_movie_parser.dart';

class BasicMovie {
  final bool? isAdult;
  final String? backdropUrl;
  final List<int>? genreIds;
  final int id;
  final String title;
  final String overview;
  final String? posterUrl;
  final DateTime releaseDate;
  final double voteAverage;
  final int voteCount;

  const BasicMovie({
    this.isAdult,
    this.backdropUrl,
    this.genreIds,
    required this.id,
    required this.title,
    required this.overview,
    this.posterUrl,
    required this.releaseDate,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  factory BasicMovie.fromJson(Map<String, dynamic> json) {
    return BasicMovie(
      genreIds: BasicMovieParser.parseGenreIds(json["genre_ids"]),
      id: BasicMovieParser.parseId(json["id"]),
      title: BasicMovieParser.parseTitle(json["title"]),
      overview: BasicMovieParser.parseOverview(json["overview"]),
      posterUrl: json["poster_path"],
      // posterUrl: TmdbService.getFullImageSrc(
      //   BasicMovieParser.parseImage(json["poster_path"]),
      //   "w500",
      // ),
      releaseDate: BasicMovieParser.parseDateTime(
        json["release_date"] ?? DateTime(0),
      ),
      voteAverage: BasicMovieParser.parseDouble(json["vote_average"]),
      voteCount: BasicMovieParser.parseInt(json["vote_count"]),
    );
  }
}
