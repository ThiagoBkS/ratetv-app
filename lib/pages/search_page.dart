import 'package:flutter/material.dart';
import 'package:project_a/models/movie_preview.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/service/tmdb_service.dart';
import 'package:project_a/widgets/custom_search_bar.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';

class SearchPage extends StatefulWidget {
  final String? searchValue;
  const SearchPage({super.key, this.searchValue});

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  Future<List<MoviePreview>>? results;
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  void searchData(String value) {
    if (value.length <= 3) return;

    results = TmdbService.getMoviePreviewListByTitle(value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchBar(
              onSearch: (value) {
                searchData(value);
              },
              focusNode: searchFocusNode,
              debounceMiliseconds: 1000,
            ),

            Expanded(
              child: FutureBuilder<List<MoviePreview>>(
                future: results,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Erro ao carregar filmes"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text("Nenhum filme encontrado"));
                  }

                  final movies = snapshot.data!;
                  return GridView.count(
                    padding: EdgeInsets.all(16),
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(movies.length, (index) {
                      return MovieCard(
                        details: movies[index],
                        enableBookmarked: true,
                        enableDetailsSheet: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoviePage(
                                movieId: movies[index].id,
                                onBackToMain: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
