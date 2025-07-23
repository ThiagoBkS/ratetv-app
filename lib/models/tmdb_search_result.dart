class TMDBSearchResult {
  final bool isAdult;
  final String backdropPath;
  final List<dynamic> genreIds;
  final int id;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  TMDBSearchResult({
    required this.isAdult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory TMDBSearchResult.fromJson(Map<String, dynamic> json) {
    return TMDBSearchResult(
      isAdult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? "",
      genreIds: json["genre_ids"] ?? "",
      id: json["id"],
      overview: json["overview"] ?? "",
      posterPath: json["poster_path"] ?? "",
      releaseDate: json["release_date"] != null
          ? DateTime.parse(json["release_date"])
          : DateTime(0),
      title: json["title"] ?? "",
      voteAverage: double.parse(json["vote_average"].toString()) ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}
