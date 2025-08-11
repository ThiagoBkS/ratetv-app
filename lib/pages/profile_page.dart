import 'package:flutter/material.dart';
import 'package:project_a/models/tmdb_models/basic_movie.dart';
import 'package:project_a/service/rate_tv_service.dart';
import 'package:project_a/utils/utils.dart';
import 'package:project_a/widgets/movie_card/movie_card.dart';

class ProfilePage extends StatefulWidget {
  final String publicId;
  const ProfilePage({super.key, required this.publicId});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<List<BasicMovie>> movies;

  @override
  void initState() {
    super.initState();
    movies = fetchData();
  }

  Future<List<BasicMovie>> fetchData() async {
    return await RateTvService.getWatchedMovies(widget.publicId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: FutureBuilder<List<BasicMovie>>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('Nenhum filme assistido.'));
              } else {
                final movies = snapshot.data!;
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: GridView.count(
                        padding: EdgeInsets.all(16),
                        crossAxisCount: 3,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1 / 1.5,
                        children: List.generate(movies.length, (index) {
                          BasicMovie basicMovie = movies[index];
                          return MovieCard(
                            basicMovie: basicMovie,
                            enableBookmarked: true,
                            enableDetailsSheet: true,
                            onTap: () {
                              goToMoviePage(context, basicMovie.id);
                            },
                          );
                        }),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// class ProfileBody extends StatelessWidget {
//   final List<BasicMovie> watchedMovies;
//   const ProfileBody({super.key, required this.watchedMovies});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Container(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             spacing: 8,
//             children: [
//               Column(
//                 spacing: 4,
//                 children: [
//                   ClipOval(
//                     child: Container(
//                       height: 104,
//                       width: 104,
//                       color: Color.fromRGBO(64, 64, 64, 0.5),
//                       alignment: Alignment.center,
//                       child: Image.network(
//                         "https://exemplo.com/imagem.jpg",
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Icon(
//                             FontAwesomeIcons.solidUser,
//                             color: Color.fromRGBO(64, 64, 64, 1),
//                             size: 32,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 6),
//                   Text(
//                     "John Doe",
//                     style: GoogleFonts.montserrat(
//                       color: Colors.white,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                   Text(
//                     "@john_doe",
//                     style: GoogleFonts.montserrat(
//                       color: Colors.grey,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   SizedBox(height: 6),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     spacing: 8,
//                     children: [
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Color.fromRGBO(90, 139, 176, 1),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         padding: EdgeInsets.only(
//                           top: 4,
//                           bottom: 4,
//                           left: 12,
//                           right: 12,
//                         ),
//                         child: Row(
//                           spacing: 8,
//                           children: [
//                             Icon(
//                               FontAwesomeIcons.heartCircleCheck,
//                               size: 14,
//                               color: Color.fromRGBO(5, 53, 89, 1),
//                             ),
//                             Text(
//                               "Science Fiction",
//                               style: GoogleFonts.montserrat(
//                                 color: Color.fromRGBO(5, 53, 89, 1),
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6),
//               StatContainer(),
//               SizedBox(height: 6),
//               Divider(height: 2, radius: BorderRadius.circular(32)),
//               SizedBox(height: 6),
//               // MediaCollection(),
//               // MediaCollection(),
//               // MediaCollection(),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
