import 'package:flutter/material.dart';
import 'package:project_a/widgets/custom_bottom_navigation.dart';
import 'package:project_a/widgets/profile_widgets/profile_content.dart';
import 'package:project_a/widgets/profile_widgets/profile_list_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigation(),
      body: SafeArea(child: ProfilePageBody()),
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          ProfileContent(),
          SizedBox(height: 8),
          ProfileListCard(),
          SizedBox(height: 8),
          ProfileListCard(),
          SizedBox(height: 8),
          ProfileListCard(),
        ],
      ),
    );
  }
}

// class ProfilePgaeBody extends StatelessWidget {
//   const ProfilePgaeBody({super.key});

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
//                             LucideIcons.user,
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
//                               LucideIcons.heart,
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

//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
