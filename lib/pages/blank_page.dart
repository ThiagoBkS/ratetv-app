import 'package:flutter/material.dart';
import 'package:project_a/models/basic_movie.dart';
import 'package:project_a/widgets/movie_card.dart';

class BlankPage extends StatefulWidget {
  const BlankPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return BlankPageState();
  }
}

class BlankPageState extends State<BlankPage> {
  final List<BasicMovie> movies = [
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": "/eU7IfdWq8KQy0oNd4kKXS0QUR08.jpg",
      "genre_ids": [878, 12, 28],
      "id": 1061474,
      "original_language": "en",
      "original_title": "Superman",
      "overview":
          "Superman, um jovem repórter de Metrópolis, embarca em uma jornada para reconciliar sua herança kryptoniana com sua criação humana como Clark Kent.",
      "popularity": 354.5509,
      "poster_path": "/30fNMmjk183FbyzURlrDCmMHTgk.jpg",
      "release_date": "2025-07-09",
      "title": "Superman",
      "video": false,
      "vote_average": 7.448,
      "vote_count": 1106,
    }),
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": "/2PDTWfuBWQKVC7aPAqJK5UCpz08.jpg",
      "genre_ids": [28, 878],
      "id": 557,
      "original_language": "en",
      "original_title": "Spider-Man",
      "overview":
          "Peter Parker é um jovem estudioso que vive com seus tios, Ben e May, desde que seus pais faleceram. Peter tem dificuldade em se relacionar com seus colegas, por ser tímido e por eles o considerarem um nerd. Até que, em uma demonstração científica, um acidente inesperado faz com que uma aranha modificada geneticamente pique Peter. A partir de então seu corpo é quimicamente alterado pela picada da aranha.",
      "popularity": 18.5394,
      "poster_path": "/2WIwz0qJpnVAiofTAhrmhbKxuvE.jpg",
      "release_date": "2002-05-01",
      "title": "Homem-Aranha",
      "video": false,
      "vote_average": 7.313,
      "vote_count": 19723,
    }),
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [18, 14, 10751],
      "id": 539176,
      "original_language": "en",
      "original_title": "Mario",
      "overview":
          "Set during summer in the Îles-de-la-Madeleine of Quebec, Mario and Simon are two brothers living in a fishing village with their mother, who runs a grocery story, and their father, who runs a fishing business. Mario is ten years old, mute and autistic. He is withdrawn from reality and living in a surreal world that only his older brother Simon and his stuffed coyote share. Mario is very close with and deeply admires his 18 year old brother, whom he depends upon for love and attention. Simon reads Arabian Knights stories to Mario, dresses him in sheik's clothing and they play out imaginary wars in an Arabian style fortress that they built. Everything changes when Helene, a beautiful young tourist comes between the two brothers. Simon falls in love and begins to neglect his brother to spend time with her. Mario feels rejected and discovers what hate and jealously are. He sets about a chain of events that lead to tragedy.",
      "popularity": 0.3623,
      "poster_path": "/b5fLqlXhypaD3A02ve5kOhmIx1I.jpg",
      "release_date": "1984-10-18",
      "title": "Mario",
      "video": false,
      "vote_average": 5,
      "vote_count": 4,
    }),
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": "/jDW24Hswd1gCHqmPUxf32E2K3yY.jpg",
      "genre_ids": [28],
      "id": 558077,
      "original_language": "bn",
      "original_title": "Superman",
      "overview":
          "A child from a dying world is sent to Earth, where his alien physiology renders him superhuman. Bengali remake of the 1978 classic.",
      "popularity": 0.7998,
      "poster_path": "/deA1k1ZnenD9zdm2deoXgbnZo7n.jpg",
      "release_date": "1990-01-01",
      "title": "Superman",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 6,
    }),
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": "/AuUAB6bHEltolSvbBslfNSgsRIm.jpg",
      "genre_ids": [14, 28, 80],
      "id": 268,
      "original_language": "en",
      "original_title": "Batman",
      "overview":
          "Em Gotham City o milionário Bruce Wayne, que quando jovem teve os pais assassinados por bandidos, resolve combater o crime como Batman, o Homem-Morcego. Mas chega o dia em que o vilão Coringa decide dominar a cidade e se torna um grande desafio para o super-herói.",
      "popularity": 9.8643,
      "poster_path": "/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg",
      "release_date": "1989-06-21",
      "title": "Batman",
      "video": false,
      "vote_average": 7.233,
      "vote_count": 8135,
    }),
    BasicMovie.fromJson({
      "adult": false,
      "backdrop_path": "/l33oR0mnvf20avWyIMxW02EtQxn.jpg",
      "genre_ids": [12, 18, 878],
      "id": 157336,
      "original_language": "en",
      "original_title": "Interstellar",
      "overview":
          "As reservas naturais da Terra estão chegando ao fim e um grupo de astronautas recebe a missão de verificar possíveis planetas para receberem a população mundial, possibilitando a continuação da espécie. Cooper é chamado para liderar o grupo e aceita a missão sabendo que pode nunca mais ver os filhos. Ao lado de Brand, Jenkins e Doyle, ele seguirá em busca de um novo lar.",
      "popularity": 39.1464,
      "poster_path": "/nCbkOyOMTEwlEV0LtCOvCnwEONA.jpg",
      "release_date": "2014-11-05",
      "title": "Interestelar",
      "video": false,
      "vote_average": 8.458,
      "vote_count": 37494,
    }),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: List.generate(movies.length, (index) {
              BasicMovie movie = movies[index];
              return MovieCard(details: movie, onTap: () {}, onPress: () {});
            }),
          ),
        ),
      ),
    );
  }
}
