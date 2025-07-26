import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MediaCollection extends StatelessWidget {
  const MediaCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(64, 64, 64, 0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: double.infinity,
              height: 128,
              child: Image.network(
                "a",
                fit: BoxFit.cover,
                errorBuilder: (context, object, stackTrace) {
                  return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color.fromRGBO(64, 64, 64, 0.2),
                    child: Icon(FontAwesomeIcons.image),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Watch Later",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Movies to watch later, a special selection of movies you still have to watch.",
            style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 8,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(90, 139, 176, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Text(
                      "401 Items",
                      style: GoogleFonts.montserrat(
                        color: Color.fromRGBO(5, 53, 89, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(90, 139, 176, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Text(
                      "149h 59m",
                      style: GoogleFonts.montserrat(
                        color: Color.fromRGBO(5, 53, 89, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(222, 181, 34, 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.only(
                  top: 4,
                  bottom: 4,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      size: 14,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    Text(
                      "8.9",
                      style: GoogleFonts.montserrat(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// InkWell(
//       onTap: () {},
//       borderRadius: BorderRadius.circular(4),
//       child: Container(
//         padding: EdgeInsets.all(8),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             SizedBox(height: 16),
//           ],
//         ),
//       ),
//     )
// Container(
//       color: Colors.red,
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Text("Watch Later"),
//               Text(
//                 "Movies to watch later, a special selection of movies you still have to watch",
//               ),
//             ],
//           ),
//           Container(
//             child: Image.network("https://placehold.co/100x150/EEE/31343C.jpg"),
//           ),
//         ],
//       ),
//     );
