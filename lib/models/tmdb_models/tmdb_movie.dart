import 'package:project_a/models/movie.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/utils/data_adapter.dart';

class TmdbMovie implements Movie {
  @override
  final bool isAdult;

  @override
  final String backdropUrl;

  @override
  final int budget;

  @override
  final List<int> genreIds;

  @override
  final int id;

  @override
  final String imdbId;

  @override
  final String overview;

  @override
  final String posterUrl;

  @override
  final DateTime releaseDate;

  @override
  final int revenue;

  @override
  final int runtime;

  @override
  final String tagline;

  @override
  final String title;

  @override
  final double voteAverage;

  @override
  final int voteCount;

  TmdbMovie({
    required this.isAdult,
    required this.backdropUrl,
    required this.budget,
    required this.genreIds,
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
  });

  factory TmdbMovie.fromJson(Map<String, dynamic> json) {
    return TmdbMovie(
      isAdult: DataAdapter.parseBool(json["adult"], false),
      backdropUrl: DataAdapter.parseString(
        TmdbService.getFullImageSrc(json["backdrop_path"]),
        "",
      ),
      budget: DataAdapter.parseInt(json["budget"], 0),
      genreIds: DataAdapter.parseIntList(json['genre_ids'], []), // Corrijir
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
    );
  }
}
