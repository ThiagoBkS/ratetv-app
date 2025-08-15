import 'package:flutter/material.dart';
import 'package:project_a/exceptions/error_message.dart';
import 'package:project_a/models/collection.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/placeholder/placeholder_movies_action.dart';
import 'package:project_a/service/rate_tv_service.dart';
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

  late Future<List<BasicMovie>> movies;
  ErrorMessage? error;

  @override
  void initState() {
    super.initState();
    movies = getCollection();
  }

  Future<List<BasicMovie>> getCollection() async {
    try {
      return await RateTvService.getCollectionItems(1);
    } catch (err) {
      error = ErrorMessage(title: "Ops!", message: err.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: FutureBuilder<List<BasicMovie>>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError || error != null) {
                return Center(
                  child: Text(error?.message ?? 'Erro ao carregar'),
                );
              }
              final items = snapshot.data ?? [];
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return MovieCollectionCard(basicMovie: items[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
