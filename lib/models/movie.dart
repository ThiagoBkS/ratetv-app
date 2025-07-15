class Genre {
  final String label;

  const Genre({required this.label});
}

class Movie {
  final String backdropImage;
  final String posterPath;
  final String title;
  final String releaseDate;
  final String runtime;
  final String tagline;
  final String overview;
  final List<Genre> genres;

  const Movie({
    required this.backdropImage,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.runtime,
    required this.tagline,
    required this.overview,
    required this.genres,
  });
}
