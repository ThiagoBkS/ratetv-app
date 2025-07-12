import 'package:flutter/material.dart';
import 'package:project_a/models/section_model.dart';
import 'package:project_a/widgets/card_list/horizontal_card_list.dart';
import 'package:project_a/widgets/category/category_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<SectionModel> sections = [
    SectionModel(
      title: "Tendências",
      items: List.filled(5, "https://placehold.co/100x150/EEE/31343C.jpg"),
    ),
    SectionModel(
      title: "Populares",
      items: List.filled(5, "https://placehold.co/100x150/EEE/31343C.jpg"),
    ),
    SectionModel(
      title: "Comédias",
      items: List.filled(5, "https://placehold.co/100x150/EEE/31343C.jpg"),
    ),
    SectionModel(
      title: "Terror",
      items: List.filled(5, "https://placehold.co/100x150/EEE/31343C.jpg"),
    ),
    SectionModel(
      title: "Romance",
      items: List.filled(5, "https://placehold.co/100x150/EEE/31343C.jpg"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          CategorySection(),
          for (SectionModel section in sections) ...[
            SizedBox(height: 24),
            HorizontalCardList(
              sectionTitle: section.title,
              sectionItems: section.items,
            ),
          ],
        ],
      ),
    );
  }
}
