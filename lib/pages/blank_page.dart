import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_a/models/basic_collection.dart';
import 'package:project_a/widgets/collection_card/collection_card.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Collection> collections = [
      Collection(
        title: "Top 50 Filmes de Comédia",
        description:
            "Os 50 filmes mais divertidos de todos os tempos, selecionados pelas críticas.",
        backdropUrl:
            "https://media.themoviedb.org/t/p/original/9l6bcHNFLR2fcCBSPzEeqxiQhwU.jpg",
      ),
      Collection(
        title: "Top 50 Filmes de Ação",
        description:
            "Os 50 filmes mais eletrizantes de ação, com base na crítica.",
        backdropUrl:
            "https://image.tmdb.org/t/p/original/gqby0RhyehP3uRrzmdyUZ0CgPPe.jpg",
      ),
      Collection(
        title: "Top 50 Filmes de Terror",
        description:
            "Os 50 filmes mais assustadores e intensos, selecionados pelas críticas.",
        backdropUrl:
            "https://media.themoviedb.org/t/p/original/gIwG9UWJLsiSBfaG5GJWGj9ghXD.jpg",
      ),
      Collection(
        title: "Top 50 Filmes de Heróis",
        description:
            "Os 50 filmes de super-heróis mais épicos, escolhidos pelas críticas.",
        backdropUrl:
            "https://media.themoviedb.org/t/p/original/mMS24Uh4AsgkchTFFQaOwFnFDnO.jpg",
      ),
      Collection(
        title: "Top 50 Filmes de Drama",
        description:
            "Os 50 filmes dramáticos mais emocionantes e aclamados pela crítica.",
        backdropUrl:
            "https://media.themoviedb.org/t/p/original/72rRSPAZ82p3KXoGLz2ddTioMQl.jpg",
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  spacing: 4.h,

                  children: List.generate(collections.length, (index) {
                    Collection collection = collections[index];
                    return CollectionCard(
                      collection: collection,
                      color: Color.fromRGBO(20, 27, 34, 1),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
