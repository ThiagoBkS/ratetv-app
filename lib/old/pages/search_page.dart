import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/old/models/tmdb_search_result.dart';
import 'package:project_a/old/models/tmdb_service.dart';
import 'package:project_a/old/pages/movie_page.dart';
import 'package:project_a/old/widgets/movie_details_sheet/movie_details_sheet.dart';
import 'package:project_a/old/widgets/search_bar.dart';

void showMovieDetailsSheet(BuildContext context, TMDBSearchResult movie) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Color.fromRGBO(24, 28, 31, 1),
    builder: (context) => MovieDetailsSheet(movie: movie),
  );
}

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
  FocusNode searchFocusNode = FocusNode();

  void openMovieDetailsSheet(TMDBSearchResult movie) {
    showMovieDetailsSheet(context, movie);
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

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
            CustomSearchBar(
              onSearch: searchData,
              focusNode: searchFocusNode,
              debounceMiliseconds: 500,
            ),
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
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MoviePage(movieId: result.id),
                                  ),
                                );
                              },
                              onLongPress: () {
                                openMovieDetailsSheet(result);
                                searchFocusNode.unfocus();
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://image.tmdb.org/t/p/w200/${result.posterPath}.jpg",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: double.infinity,
                                height: double.infinity,
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
