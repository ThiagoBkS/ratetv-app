import 'package:project_a/models/production/production_company.dart';
import 'package:project_a/models/production/production_country.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/utils/data_adapter.dart';

class Movie {
  final bool isAdult;
  final String backdropUrl;
  final int budget;
  final List<String> genres;
  final int id;
  final String imdbId;
  final String overview;
  final String posterUrl;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  final String originalTitle;
  final String originCountry;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountry;

  Movie({
    required this.isAdult,
    required this.backdropUrl,
    required this.budget,
    required this.genres,
    required this.id,
    required this.imdbId,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,

    required this.originalTitle,
    required this.originCountry,
    required this.productionCompanies,
    required this.productionCountry,
  });

  static String formatRuntime(int runtime) {
    int hours = (runtime / 60).toInt();
    int minutes = (runtime % 60).toInt();

    if (hours <= 0) return "${minutes}m";
    return "${hours}h ${minutes}m";
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      isAdult: DataAdapter.parseBool(json["adult"], false),
      backdropUrl: DataAdapter.parseString(
        TmdbService.getFullImageSrc(json["backdrop_path"]),
        "",
      ),
      budget: DataAdapter.parseInt(json["budget"], 0),
      genres: DataAdapter.parseStringList(json['genres'], []),
      id: DataAdapter.parseInt(json['id'], -1),
      imdbId: DataAdapter.parseString(json["tagline"], ""),
      overview: DataAdapter.parseString(
        json['overview'],
        "Descrição não disponível.",
      ),
      posterUrl: DataAdapter.parseString(
        TmdbService.getFullImageSrc(json["poster_path"]),
        "",
      ),
      releaseDate: DataAdapter.parseDateTime(
        json["release_date"],
        DateTime(1970, 1, 1),
      ),
      revenue: DataAdapter.parseInt(json["revenue"], 0),
      runtime: DataAdapter.parseInt(json["runtime"], 0),
      tagline: DataAdapter.parseString(json["tagline"], ""),
      title: DataAdapter.parseString(json['title'], "Sem título"),
      voteAverage: DataAdapter.parseDouble(json['vote_average'], 0.0),
      voteCount: DataAdapter.parseInt(json['vote_count'], 0),

      originalTitle: DataAdapter.parseString(
        json["original_title"],
        "Desconhecido",
      ),
      originCountry: DataAdapter.parseString(
        json["origin_country"],
        "Desconhecido",
      ),
      productionCompanies: [
        ProductionCompany(name: "Fox 2000 Pictures"),
        ProductionCompany(name: "Regency Enterprises"),
        ProductionCompany(name: "Linson Entertainment"),
        ProductionCompany(name: "20th Century Fox"),
        ProductionCompany(name: "Taurus Film"),
      ],
      productionCountry: [
        ProductionCountry(name: "Germany"),
        ProductionCountry(name: "United States of America"),
      ],
    );
  }
}
