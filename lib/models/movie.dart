import 'package:project_a/models/cast.dart';
import 'package:project_a/models/tmdb_movie.dart';

class CompleteMovie {
  final TMDBMovie movie;
  final List<TMDBCast> cast;

  const CompleteMovie({required this.movie, required this.cast});
}
