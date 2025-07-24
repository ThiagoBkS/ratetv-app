import 'package:flutter/material.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/old/widgets/search_bar.dart';
import 'package:project_a/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage> {
  Future<List<BasicMovie>>? results;
  String searchValue = "Pesquisa: ";
  FocusNode searchFocusNode = FocusNode();

  void openMovieDetailsSheet(BasicMovie movie) {
    // showMovieDetailsSheet(context, movie);
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

    // results = TmdbService.getMovieByTitle(value);
    setState(() {
      searchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Inicia a busca apenas uma vez
    if (results == null) {
      searchData("superman");
    }

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
              child: FutureBuilder<List<BasicMovie>>(
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
                        onTap: () {},
                        onPress: () {},
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
