import 'package:project_a/utils/data_adapter.dart';

class MovieCast {
  final int id;
  final String name;
  final String image;
  final String character;

  MovieCast({
    required this.id,
    required this.name,
    required this.image,
    required this.character,
  });

  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(
      id: DataAdapter.parseInt(json['id'], 0),
      name: DataAdapter.parseString(json['original_name'], "Unknown"),
      image: DataAdapter.parseString(json['profile_path'], ""),
      character: DataAdapter.parseString(json['character'], "Unknown"),
    );
  }
}
