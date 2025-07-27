import 'package:project_a/models/movie_cast.dart';
import 'package:project_a/utils/data_adapter.dart';

class TmdbMovieCast implements MovieCast {
  @override
  final int id;

  @override
  final String name;

  @override
  final String image;

  @override
  final String character;

  TmdbMovieCast({
    required this.id,
    required this.name,
    required this.image,
    required this.character,
  });

  factory TmdbMovieCast.fromJson(Map<String, dynamic> json) {
    return TmdbMovieCast(
      id: DataAdapter.parseInt(json['id'], 0),
      name: DataAdapter.parseString(json['original_name'], "Unknown"),
      image: DataAdapter.parseString(json['profile_path'], ""),
      character: DataAdapter.parseString(json['character'], "Unknown"),
    );
  }
}
