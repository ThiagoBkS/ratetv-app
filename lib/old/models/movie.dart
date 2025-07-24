import 'package:project_a/old/models/cast.dart';
import 'package:project_a/old/models/tmdb_movie.dart';

class CompleteMovie {
  final TMDBMovie movie;
  final List<TMDBCast> cast;

  const CompleteMovie({required this.movie, required this.cast});
}
