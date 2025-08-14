import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

                  children: [
                    CollectionCard(
                      color: Color.fromRGBO(20, 27, 34, 1),
                      collection: Collection(
                        title: "Top 100 Filmes de Comédia",
                        description:
                            "Os 100 filmes mais divertidos de todos os tempos, selecionados pelas críticas.",
                        backdropUrl:
                            "https://media.themoviedb.org/t/p/original/9l6bcHNFLR2fcCBSPzEeqxiQhwU.jpg",
                      ),
                    ),
                    CollectionCard(
                      color: Color.fromRGBO(20, 27, 34, 1),
                      collection: Collection(
                        title: "Top 100 Filmes de Ação",
                        description:
                            "Os 100 filmes mais eletrizantes de ação, com base na crítica.",
                        backdropUrl:
                            "https://image.tmdb.org/t/p/original/gqby0RhyehP3uRrzmdyUZ0CgPPe.jpg",
                      ),
                    ),

                    CollectionCard(
                      color: Color.fromRGBO(20, 27, 34, 1),
                      collection: Collection(
                        title: "Top 100 Filmes de Terror",
                        description:
                            "Os 100 filmes mais assustadores e intensos, selecionados pelas críticas.",
                        backdropUrl:
                            "https://media.themoviedb.org/t/p/original/gIwG9UWJLsiSBfaG5GJWGj9ghXD.jpg",
                      ),
                    ),

                    CollectionCard(
                      color: Color.fromRGBO(20, 27, 34, 1),
                      collection: Collection(
                        title: "Top 100 Filmes de Heróis",
                        description:
                            "Os 100 filmes de super-heróis mais épicos, escolhidos pelas críticas.",
                        backdropUrl:
                            "https://media.themoviedb.org/t/p/original/mMS24Uh4AsgkchTFFQaOwFnFDnO.jpg",
                      ),
                    ),

                    CollectionCard(
                      color: Color.fromRGBO(20, 27, 34, 1),
                      collection: Collection(
                        title: "Top 100 Filmes de Drama",
                        description:
                            "Os 100 filmes dramáticos mais emocionantes e aclamados pela crítica.",
                        backdropUrl:
                            "https://media.themoviedb.org/t/p/original/72rRSPAZ82p3KXoGLz2ddTioMQl.jpg",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
