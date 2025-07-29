import 'package:project_a/models/tmdb_models/basic_movie.dart';

class Collection {
  final int id;
  final String title;
  final String overview;
  final DateTime createdAt;
  final String creator;
  final List<BasicMovie> items;

  const Collection({
    required this.id,
    required this.title,
    required this.overview,
    required this.createdAt,
    required this.creator,
    required this.items,
  });
}
