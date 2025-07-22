import 'package:intl/intl.dart';
import 'package:project_a/models/tmdb_genre.dart';

class TMDBMovie {
  final bool adult;
  final String backdropPath;
  final int budget;
  final List<TMDBGenre> genres;
  final int id;
  final String imdbId;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  const TMDBMovie({
    required this.adult,
    required this.backdropPath,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  static String formattedDate(String stringDate) {
    DateTime date = DateTime.parse(stringDate);
    return DateFormat('dd MMM yyyy', 'pt_BR').format(date);
  }

  static String formattedTime(int time) {
    int totalMinutes = 130;
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    return "${hours}h ${minutes}m";
  }

  static String formattedCurrency(double currency) {
    NumberFormat formatter = NumberFormat.currency(
      locale: "en_US",
      symbol: 'U\$',
    );

    return formatter.format(currency);
  }

  factory TMDBMovie.fromJson(Map<String, dynamic> json) {
    return TMDBMovie(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      budget: json["budget"],
      genres: [],
      id: json["id"],
      imdbId: json["imdb_id"],
      overview: json["overview"] ?? "Este titulo não possui uma sinopse",
      posterPath: json["poster_path"],
      releaseDate: json["release_date"] != null
          ? DateTime.parse(json["release_date"])
          : DateTime(0),
      revenue: json["revenue"],
      runtime: json["runtime"],
      tagline: json["tagline"],
      title: json["title"] ?? "No Title",
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }
}
