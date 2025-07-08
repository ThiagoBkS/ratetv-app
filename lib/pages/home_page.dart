import 'package:flutter/material.dart';
import 'package:project_a/models/section_data.dart';
import 'package:project_a/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:project_a/widgets/card_list/horizontal_card_list.dart';
import 'package:project_a/widgets/category/category_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Color.fromRGBO(21, 21, 29, 1),
      ),
      backgroundColor: Color.fromRGBO(21, 21, 29, 1),
      body: Padding(padding: EdgeInsets.all(16), child: HomeBody()),
      bottomNavigationBar: SafeArea(bottom: true, child: BottomNavigation()),
    );
  }
}

class HomeBody extends StatelessWidget {
  HomeBody({super.key});

  final List<SectionModel> sections = [
    SectionModel(
      title: "Tendências",
      items: [
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
      ],
    ),
    SectionModel(
      title: "Populares",
      items: [
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
      ],
    ),
    SectionModel(
      title: "Comédias",
      items: [
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
      ],
    ),
    SectionModel(
      title: "Terror",
      items: [
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
      ],
    ),
    SectionModel(
      title: "Romance",
      items: [
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
        "https://placehold.co/100x150/EEE/31343C.jpg",
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}
