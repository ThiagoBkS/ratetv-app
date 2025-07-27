import 'package:flutter/material.dart';
import 'package:project_a/exceptions/error_message.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/movie_cast.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_backdrop.dart';
import 'package:project_a/widgets/movie_page_widgets/movie_content.dart';

class MoviePage extends StatefulWidget {
  final int movieId;
  final VoidCallback onBackToMain;

  const MoviePage({
    super.key,
    required this.movieId,
    required this.onBackToMain,
  });

  @override
  State<StatefulWidget> createState() => MoviePageState();
}

class MoviePageState extends State<MoviePage> {
  Movie? movie;
  List<MovieCast>? cast;
  ErrorMessage? errorMessage;

  late int movieId;
  late VoidCallback onBackToMain;

  @override
  void initState() {
    super.initState();

    movieId = widget.movieId;
    onBackToMain = widget.onBackToMain;

    fetchData();
  }

  void fetchData() async {
    try {
      movie = await TmdbService.getMovieById(widget.movieId);
      cast = await TmdbService.getMovieCastList(widget.movieId);
      setState(() {});
    } catch (err) {
      errorMessage = ErrorMessage(
        title: "Erro",
        message: "Algo deu errado. Tente novamente.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filme"),
        leading: BackButton(onPressed: onBackToMain),
      ),
      body: SafeArea(
        child: errorMessage != null
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        errorMessage!.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(errorMessage!.message),
                      Text("opa"),
                    ],
                  ),
                ),
              )
            : (movie == null
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        MovieBackdrop(imageUrl: movie!.backdropUrl),
                        MovieContent(data: movie!, cast: cast!),
                      ],
                    )),
      ),
    );
  }
}
