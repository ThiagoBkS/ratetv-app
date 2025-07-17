import 'package:flutter/material.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/models/movie.dart';
import 'package:project_a/models/platform.dart';
import 'package:project_a/widgets/movie_backdrop.dart';
import 'package:project_a/widgets/movie_content.dart';

class MoviePage extends StatelessWidget {
  // final Movie movie = Movie(
  //   backdropImage:
  //       "https://media.themoviedb.org/t/p/w500/kVd3a9YeLGkoeR50jGEXM6EqseS.jpg",
  //   posterPath:
  //       "https://image.tmdb.org/t/p/w500/4CwKj1fw33BXYzxvrpM3GlAhK4L.jpg",
  //   title: "Homem-Aranha: Através do Aranhaverso",
  //   releaseDate: "01/06/2023",
  //   runtime: "140",
  //   tagline: "É como você usa a máscara que importa.",
  //   overview:
  //       "Miles Morales retorna para o próximo capítulo da saga do Aranhaverso, uma aventura épica que transportará o Homem-Aranha em tempo integral e amigável do bairro do Brooklyn através do Multiverso para unir forças com Gwen Stacy e uma nova equipe de Homens-Aranha para enfrentar com um vilão mais poderoso do que qualquer coisa que eles já encontraram.",
  //   genres: [
  //     Genre(label: "Animação"),
  //     Genre(label: "Ação"),
  //     Genre(label: "Aventura"),
  //     Genre(label: "Ficção científica"),
  //   ],
  //   avaliablePlatforms: [
  //     StreamingPlatform(
  //       image: "https://images.justwatch.com/icon/207360008/s100/image.png",
  //       label: "Netflix",
  //     ),
  //     StreamingPlatform(
  //       image: "https://images.justwatch.com/icon/313118777/s100/image.png",
  //       label: "Disney+",
  //     ),
  //     StreamingPlatform(
  //       image: "https://images.justwatch.com/icon/190848813/s100/image.png",
  //       label: "AppleTV",
  //     ),
  //     StreamingPlatform(
  //       image: "https://images.justwatch.com/icon/332884837/s100/image.png",
  //       label: "HBO Max",
  //     ),
  //   ],
  // );
  final Movie movie = Movie(
    backdropImage:
        "https://media.themoviedb.org/t/p/w500/ApRxyHFuvv5yghedxXPJSm9FEDe.jpg",
    posterPath:
        "https://image.tmdb.org/t/p/w500/30fNMmjk183FbyzURlrDCmMHTgk.jpg",
    title: "Superman",
    releaseDate: DateTime(2025, 7, 10),
    runtime: 129,
    tagline: "Olhe para cima.",
    overview:
        "Superman, um jovem repórter de Metrópolis, embarca em uma jornada para reconciliar sua herança kryptoniana com sua criação humana como Clark Kent.",
    genres: [
      Genre(label: "Ficção científica"),
      Genre(label: "Aventura"),
      Genre(label: "Ação"),
    ],
    avaliablePlatforms: [
      StreamingPlatform(
        image: "https://images.justwatch.com/icon/207360008/s100/image.png",
        label: "Netflix",
      ),
      StreamingPlatform(
        image: "https://images.justwatch.com/icon/313118777/s100/image.png",
        label: "Disney+",
      ),
      StreamingPlatform(
        image: "https://images.justwatch.com/icon/190848813/s100/image.png",
        label: "AppleTV",
      ),
      StreamingPlatform(
        image: "https://images.justwatch.com/icon/332884837/s100/image.png",
        label: "HBO Max",
      ),
    ],
  );

  MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                MovieBackdrop(image: movie.backdropImage),
                MovieContent(movie: movie),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
