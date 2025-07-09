import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/widgets/custom_bottom_navigation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            "Search",
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SafeArea(child: SearchBox()),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class SearchBox extends StatefulWidget {
  const SearchBox({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchBoxState();
  }
}

class SearchBoxState extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(LucideIcons.search));
  }
}

// class SearchBoxState extends State<SearchBox> {
//   late final TextEditingController controller;
//   String inputValue = "";

//   @override
//   void initState() {
//     super.initState();
//     controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   void updateInputValue(String newValue) {
//     setState(() {
//       inputValue = newValue;
//     });
//   }

//   void cleanInputValue() {
//     updateInputValue("");
//     controller.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: SizedBox(
//             height: 52,
//             child: SearchBar(
//               controller: controller,
//               onChanged: (value) {
//                 updateInputValue(value);
//               },
//               hintText: "Pesquise",
//               leading: IconButton(
//                 onPressed: null,
//                 icon: Icon(
//                   FontAwesomeIcons.magnifyingGlass,
//                   color: Colors.white,
//                   size: 18,
//                 ),
//               ),
//               trailing: [
//                 if (inputValue.isNotEmpty)
//                   IconButton(
//                     onPressed: cleanInputValue,
//                     icon: Icon(FontAwesomeIcons.xmark),
//                   ),
//               ],
//               elevation: WidgetStateProperty.all(0),
//               shape: WidgetStateProperty.all(
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//               ),
//               backgroundColor: WidgetStateProperty.all(
//                 Color.fromRGBO(64, 64, 64, 0.25),
//               ),
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.all(8),
//           child: SizedBox(
//             height: 160,
//             child: Column(
//               children: [
//                 for (final item in [
//                   "a",
//                   "b",
//                   "b",
//                   "b",
//                   "b",
//                   "b",
//                   "b",
//                   "b",
//                   "b",
//                 ]) ...[TitleCard(imageURL: item), SizedBox(width: 4)],
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
