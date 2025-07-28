import 'package:flutter/material.dart';
import 'package:project_a/models/tmdb_models/movie_basic.dart';
import 'package:project_a/pages/search_page.dart';
import 'package:project_a/widgets/custom_search_bar.dart';
import 'package:project_a/widgets/home_widgets/genres_section.dart';
import 'package:project_a/widgets/movie_list_section.dart';

class HomePage extends StatelessWidget {
  final Function(int movieId) onMovieSelected;
  HomePage({super.key, required this.onMovieSelected});

  final placeholder = const [
    {
      "adult": false,
      "backdrop_path": "/ApRxyHFuvv5yghedxXPJSm9FEDe.jpg",
      "genre_ids": [878, 12, 28],
      "id": 1061474,
      "original_language": "en",
      "original_title": "Superman",
      "overview":
          "Superman, um jovem repórter de Metrópolis, embarca em uma jornada para reconciliar sua herança kryptoniana com sua criação humana como Clark Kent.",
      "popularity": 311.3651,
      "poster_path": "/30fNMmjk183FbyzURlrDCmMHTgk.jpg",
      "release_date": "2025-07-09",
      "title": "Superman",
      "video": false,
      "vote_average": 7.426,
      "vote_count": 1220,
    },
    {
      "adult": false,
      "backdrop_path": "/5PfHGXosySGs0l1JfeREspy3v6G.jpg",
      "genre_ids": [878, 28, 12],
      "id": 1924,
      "original_language": "en",
      "original_title": "Superman",
      "overview":
          "Jor-El, um renomado cientista, prevê a destruição do seu planeta e alerta o governo, que não lhe dá credito. Assim, decide salvar seu filho, mandando-o ao planeta Terra, onde terá superpoderes. Na Terra, ele usa o nome de Clark Kent e, já adulto, trabalha como repórter em um jornal, não demonstra ter superpoderes. Mas quando uma situação inesperada põe em risco a vida de Lois Lane, uma colega de trabalho, ele é obrigado a se revelar para o público, ficando conhecido popularmente como Superman. Descontente com o surgimento de um super-herói na cidade, Lex Luthor, um gênio do mal, o obriga a se desdobrar para evitar a morte de milhões de pessoas.",
      "popularity": 17.8473,
      "poster_path": "/sm6BLvYCSe4pUpW2UrCKSsS1o0B.jpg",
      "release_date": "1978-12-14",
      "title": "Superman: O Filme",
      "video": false,
      "vote_average": 7.147,
      "vote_count": 4020,
    },
    {
      "adult": false,
      "backdrop_path": "/6PCprqrm0kdzYdAtZlSiFoY0Ypi.jpg",
      "genre_ids": [28, 16, 10751, 12, 878, 14],
      "id": 95414,
      "original_language": "en",
      "original_title": "Superman",
      "overview":
          "Depois que o Daily Planet recebe uma carta de um cientista louco ameaçando causar destruição com seu Electrothanasia Ray, Lois Lane sai na esperança de obter mais informações para uma notícia.",
      "popularity": 3.0232,
      "poster_path": "/4DK6wWZTp6v32NUXszkHOPGxm16.jpg",
      "release_date": "1941-09-26",
      "title": "Superman contra o Cientista Louco",
      "video": false,
      "vote_average": 6.9,
      "vote_count": 107,
    },
    {
      "adult": false,
      "backdrop_path": null,
      "genre_ids": [28, 12, 878],
      "id": 167595,
      "original_language": "hi",
      "original_title": "Superman",
      "overview":
          "In this Indian take on the classic superhero story, a young baby from the doomed planet Krypton is sent to Earth, where he is adopted by an elderly couple in India who name him Shekhar. After growing to an adult and learning about his origins and powers, he goes to the city in search of his school sweetheart, Gita, who has become a newpaper reporter. At the same time, Verma, Shekhar's rival for Gita's affection in their school days, has gone on to become a crime lord and general super-villain. Verma has hatched at plan to become rich by devastating part of India with natural disasters, then buying up all of the abandoned land. Will Superman/Shekhar be able to put a stop to Verma's evil plan? Will he win Gita's heart? Will he keep his double identity a secret?",
      "popularity": 1.0551,
      "poster_path": "/xC7uUL6liwvkATfYs89Ag5TqW3O.jpg",
      "release_date": "1987-12-31",
      "title": "Superman",
      "video": false,
      "vote_average": 4.7,
      "vote_count": 16,
    },
    {
      "adult": false,
      "backdrop_path": "/jDW24Hswd1gCHqmPUxf32E2K3yY.jpg",
      "genre_ids": [28],
      "id": 558077,
      "original_language": "bn",
      "original_title": "Superman",
      "overview":
          "A child from a dying world is sent to Earth, where his alien physiology renders him superhuman. Bengali remake of the 1978 classic.",
      "popularity": 0.5973,
      "poster_path": "/deA1k1ZnenD9zdm2deoXgbnZo7n.jpg",
      "release_date": "1990-01-01",
      "title": "Superman",
      "video": false,
      "vote_average": 7.4,
      "vote_count": 6,
    },
  ].map((obj) => MovieBasic.fromJson(obj)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: CustomSearchBar(
                  onSearch: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(searchValue: value),
                      ),
                    );
                  },
                  focusNode: FocusNode(),
                ),
              ),
              GenresSection(),
              SizedBox(height: 16),

              MovieListSection(label: "Recents", movies: placeholder),
              MovieListSection(label: "Comedy", movies: placeholder),
              MovieListSection(label: "Action", movies: placeholder),
              MovieListSection(label: "Terror", movies: placeholder),
            ],
          ),
        ),
      ),
    );
  }
}
