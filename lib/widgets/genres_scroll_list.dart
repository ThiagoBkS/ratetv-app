import 'package:flutter/material.dart';
import 'package:project_a/models/genre.dart';
import 'package:project_a/widgets/genre_scroll_list_chip.dart';

class GenresScrollList extends StatelessWidget {
  final List<Genre> genres;
  const GenresScrollList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          bool isLastIndex = index >= genres.length - 1;

          return Padding(
            padding: EdgeInsets.only(right: isLastIndex ? 0 : 8),
            child: GenreScrollListChip(genre: genres[index]),
          );
        },
      ),
    );
  }
}

// colocar dentro de um section
// class GenresScrollList extends StatelessWidget {
//   final List<Genre> genres;
//   const GenresScrollList({super.key, required this.genres});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 64,
//       child: ListView.builder(
//         itemCount: genres.length,
//         scrollDirection: Axis.horizontal,

//         itemBuilder: (context, index) {
//           return Padding(
//             padding: EdgeInsets.only(right: 8),
//             child: GenreScrollListChip(genre: genres[index]),
//           );
//         },
//       ),
//     );
//   }
// }

// // deixar responsivo
// class GenreScrollListChip extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         padding: EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: Color.fromRGBO(56, 63, 68, 0.5),
//           borderRadius: BorderRadius.circular(8),
//           border: BoxBorder.all(color: Color.fromRGBO(56, 63, 68, 1), width: 2),
//         ),
//         constraints: BoxConstraints(minWidth: 96), // corrijir
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(genre.icon),
//             Text(
//               genre.label,
//               style: TextStyle(color: Color.fromRGBO(111, 120, 126, 1)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
