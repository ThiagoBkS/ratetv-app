import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/tmdb_search_result.dart';
import 'package:project_a/models/tmdb_service.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/widgets/movie_poster.dart';
import 'package:project_a/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  Future<List<TMDBSearchResult>>? results;
  String searchValue = "Pesquisa: ";

  @override
  void initState() {
    super.initState();
  }

  void searchData(String value) {
    if (value.length <= 3) return;

    results = TmdbService.getMovieByTitle(value);
    setState(() {
      searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(onSearch: searchData, debounceMiliseconds: 500),
            Expanded(
              child: FutureBuilder<List<TMDBSearchResult>>(
                future: results,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Nenhum resultado encontrado'));
                  } else {
                    final data = snapshot.data!;
                    return GridView.count(
                      padding: EdgeInsets.all(16),
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 1.5,
                      children: [
                        for (var result in data)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MoviePage(movieId: result.id),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                color: Color.fromRGBO(56, 63, 68, 0.5),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      height: double.infinity,
                                      width: double.infinity,
                                      "https://image.tmdb.org/t/p/w200/${result.posterPath}.jpg",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Center(
                                              child: Icon(
                                                LucideIcons.imageOff300,
                                                size: 48,
                                                color: Color.fromRGBO(
                                                  56,
                                                  63,
                                                  68,
                                                  1,
                                                ),
                                              ),
                                            );
                                          },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageWithOpacity extends StatefulWidget {
  final String imageUrl;

  const ImageWithOpacity({super.key, required this.imageUrl});

  @override
  State<ImageWithOpacity> createState() => _ImageWithOpacityState();
}

class _ImageWithOpacityState extends State<ImageWithOpacity> {
  double _opacity = 1.0;

  void _onTapDown(_) {
    setState(() {
      _opacity = 0.5;
    });
  }

  void _onTapUp(_) {
    setState(() {
      _opacity = 1.0;
    });
  }

  void _onTapCancel() {
    setState(() {
      _opacity = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      borderRadius: BorderRadius.circular(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: _opacity,
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Icon(
                LucideIcons.imageOff,
                size: 48,
                color: Color.fromRGBO(56, 63, 68, 1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
