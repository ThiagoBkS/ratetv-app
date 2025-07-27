import 'package:project_a/models/movie_preview.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/utils/data_adapter.dart';

class TmdbMoviePreview implements MoviePreview {
  @override
  final bool isAdult;

  @override
  final String backdropUrl;

  @override
  final List<int> genreIds;

  @override
  final int id;

  @override
  final String overview;

  @override
  final String posterUrl;

  @override
  final DateTime releaseDate;

  @override
  final String title;

  @override
  final double voteAverage;

  @override
  final int voteCount;

  TmdbMoviePreview({
    required this.isAdult,
    required this.backdropUrl,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TmdbMoviePreview.fromJson(Map<String, dynamic> json) {
    return TmdbMoviePreview(
      isAdult: DataAdapter.parseBool(json["adult"], false),
      backdropUrl: DataAdapter.parseString(
        TmdbService.getFullImageSrc(json["backdrop_path"]),
        "",
      ),
      genreIds: DataAdapter.parseIntList(json['genre_ids'], []),
      id: DataAdapter.parseInt(json['id'], -1),
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
      title: DataAdapter.parseString(json['title'], "Sem título"),
      voteAverage: DataAdapter.parseDouble(json['vote_average'], 0.0),
      voteCount: DataAdapter.parseInt(json['vote_count'], 0),
    );
  }
}
