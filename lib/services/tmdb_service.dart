import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/old/exceptions/not_found_movie.dart';
import 'dart:convert';

class TmdbService {
  static final String baseUrl = "https://api.themoviedb.org/3";

  static final String baseUrlImage = "https://image.tmdb.org/t/p/";

  static String getFullImageSrc(String path, String quality) {
    return "$baseUrl$quality$path";
  }

  static String formattedDate(String stringDate) {
    DateTime date = DateTime.parse(stringDate);
    return DateFormat('dd MMM yyyy', 'pt_BR').format(date);
  }

  static Future<List<BasicMovie>> getMovieByTitle(String title) async {
    final String apiKey = "";

    try {
      final response = await http.get(
        Uri.parse(
          '$baseUrl/search/movie?api_key=$apiKey&language=pt-BR&query=$title',
        ),
      );

      print(response.body.toString());

      final data = json.decode(response.body);

      final List<dynamic> movies = data["results"];
      return movies.map((json) => BasicMovie.fromJson(json)).toList();
    } catch (err) {
      throw NotFoundMovie("Movie with title: $title not found!");
    }
  }
}
