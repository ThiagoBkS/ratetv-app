import 'package:flutter/material.dart';
import 'package:project_a/models/collection.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/placeholder/placeholder_movies_action.dart';
import 'package:project_a/widgets/movie_collection/movie_collection_item.dart';

List<Map<String, dynamic>> items = [];

Collection actionCollection = Collection(
  id: 1,
  title: "Filmes de Ação Imperdíveis",
  overview:
      "Uma seleção especial de filmes repletos de adrenalina, cenas explosivas e muita ação do início ao fim.",
  createdAt: DateTime(2025, 7, 29),
  creator: "RateTV",
  items: placeholder_movies_action
      .map((movie) => BasicMovie.fromJson(movie))
      .toList(),
);

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CollectionPageState();
  }
}

class CollectionPageState extends State<CollectionPage> {
  final Collection collection = actionCollection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(0),
          child: ListView(
            children: [
              Column(
                spacing: 4,
                children: List.generate(collection.items.length, (index) {
                  BasicMovie basicMovie = collection.items[index];

                  return MovieCollectionCard(basicMovie: basicMovie);
                }),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
