import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/old/models/cast.dart';
import 'package:project_a/old/utils/font_size.dart';
import 'package:project_a/old/utils/spacing.dart';
import 'package:project_a/old/widgets/movie_cast_card.dart';

class MovieCastSection extends StatelessWidget {
  MovieCastSection({super.key});

  final List<dynamic> cast = [
    {
      "adult": false,
      "gender": 2,
      "id": 819,
      "known_for_department": "Acting",
      "name": "Edward Norton",
      "original_name": "Edward Norton",
      "popularity": 4.8031,
      "profile_path": "/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg",
      "cast_id": 4,
      "character": "Narrator",
      "credit_id": "52fe4250c3a36847f80149f3",
      "order": 0,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 287,
      "known_for_department": "Acting",
      "name": "Brad Pitt",
      "original_name": "Brad Pitt",
      "popularity": 9.0047,
      "profile_path": "/ajNaPmXVVMJFg9GWmu6MJzTaXdV.jpg",
      "cast_id": 5,
      "character": "Tyler Durden",
      "credit_id": "52fe4250c3a36847f80149f7",
      "order": 1,
    },
    {
      "adult": false,
      "gender": 1,
      "id": 1283,
      "known_for_department": "Acting",
      "name": "Helena Bonham Carter",
      "original_name": "Helena Bonham Carter",
      "popularity": 3.1749,
      "profile_path": "/hJMbNSPJ2PCahsP3rNEU39C8GWU.jpg",
      "cast_id": 285,
      "character": "Marla Singer",
      "credit_id": "631f0de8bd32090082733691",
      "order": 2,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7470,
      "known_for_department": "Acting",
      "name": "Meat Loaf",
      "original_name": "Meat Loaf",
      "popularity": 1.7735,
      "profile_path": "/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg",
      "cast_id": 7,
      "character": "Robert Paulson",
      "credit_id": "52fe4250c3a36847f80149ff",
      "order": 3,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7499,
      "known_for_department": "Acting",
      "name": "Jared Leto",
      "original_name": "Jared Leto",
      "popularity": 3.0124,
      "profile_path": "/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg",
      "cast_id": 286,
      "character": "Angel Face",
      "credit_id": "631f0e29ce9e91007f757d86",
      "order": 4,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7471,
      "known_for_department": "Acting",
      "name": "Zach Grenier",
      "original_name": "Zach Grenier",
      "popularity": 0.7429,
      "profile_path": "/fSyQKZO39sUsqY283GXiScOg3Hi.jpg",
      "cast_id": 31,
      "character": "Richard Chesler (Regional Manager)",
      "credit_id": "52fe4250c3a36847f8014a55",
      "order": 5,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7497,
      "known_for_department": "Acting",
      "name": "Holt McCallany",
      "original_name": "Holt McCallany",
      "popularity": 4.3713,
      "profile_path": "/tnXVshv7CD9b53BRjYrLjVJvnDS.jpg",
      "cast_id": 32,
      "character": "The Mechanic",
      "credit_id": "52fe4250c3a36847f8014a59",
      "order": 6,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7498,
      "known_for_department": "Acting",
      "name": "Eion Bailey",
      "original_name": "Eion Bailey",
      "popularity": 1.2413,
      "profile_path": "/3DW13W47cKk4LQZwS4EvRaNBoVu.jpg",
      "cast_id": 33,
      "character": "Ricky",
      "credit_id": "52fe4250c3a36847f8014a5d",
      "order": 7,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7472,
      "known_for_department": "Acting",
      "name": "Richmond Arquette",
      "original_name": "Richmond Arquette",
      "popularity": 0.6326,
      "profile_path": "/7byGiVac0GjBSVD1h6ylZlVXZK6.jpg",
      "cast_id": 34,
      "character": "Intern at Hospital",
      "credit_id": "52fe4250c3a36847f8014a61",
      "order": 8,
    },
    {
      "adult": false,
      "gender": 2,
      "id": 7219,
      "known_for_department": "Acting",
      "name": "David Andrews",
      "original_name": "David Andrews",
      "popularity": 0.8132,
      "profile_path": "/36LEerIIN7gpG52mM3Ier7YWDbh.jpg",
      "cast_id": 35,
      "character": "Thomas at Remaining Men Together",
      "credit_id": "52fe4250c3a36847f8014a65",
      "order": 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<TMDBCast> castList = cast
        .map((json) => TMDBCast.fromJson(json))
        .toList();

    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          spacing: Spacing.extraSmall,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "Cast",
                  style: GoogleFonts.montserrat(
                    fontSize: FontSize.large,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text("(${castList.length})"),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Text(
                "View more",
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 196,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (TMDBCast cast in castList)
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: MovieCastCard(
                    imageUrl:
                        "https://media.themoviedb.org/t/p/w300/${cast.profilePath}",
                    character: cast.originalName,
                    originalName: cast.character,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
