import 'package:intl/intl.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/platform.dart';

class Movie {
  final String backdropImage;
  final String posterPath;
  final String title;
  final DateTime releaseDate;
  final int runtime;
  final String tagline;
  final String overview;
  final List<Genre> genres;
  final List<StreamingPlatform> avaliablePlatforms;

  const Movie({
    required this.backdropImage,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.runtime,
    required this.tagline,
    required this.overview,
    required this.genres,
    required this.avaliablePlatforms,
  });

  String get formattedReleaseDate {
    return DateFormat("d MMM y", 'pt_BR').format(releaseDate);
  }

  String get formattedRuntime {
    int hours = (runtime / 60).toInt();
    int minutes = (runtime % 60).toInt();

    return "${hours}h ${minutes}m";
  }
}
