import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/card_list/title_card.dart';

class HorizontalCardList extends StatelessWidget {
  final String sectionTitle;
  final List<String> sectionItems;

  const HorizontalCardList({
    super.key,
    required this.sectionTitle,
    required this.sectionItems,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          sectionTitle,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              for (final item in sectionItems) ...[
                TitleCard(imageURL: item),
                SizedBox(width: 4),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
