import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/category/category_item.dart';

class CategoryModel {
  final String name;
  final IconData icon;

  const CategoryModel({required this.name, required this.icon});
}

class CategorySection extends StatelessWidget {
  final String title = "Categories";
  final List<CategoryModel> items = [
    CategoryModel(name: 'Action', icon: FontAwesomeIcons.bolt),
    CategoryModel(name: 'Comedy', icon: FontAwesomeIcons.solidFaceLaugh),
    CategoryModel(name: 'Drama', icon: FontAwesomeIcons.masksTheater),
    CategoryModel(name: 'Horror', icon: FontAwesomeIcons.ghost),
    CategoryModel(name: 'Sci-Fi', icon: FontAwesomeIcons.robot),
    CategoryModel(name: 'Romance', icon: FontAwesomeIcons.heart),
  ];

  CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See All",
                  style: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 4,
              children: [
                for (CategoryModel category in items)
                  CategoryItem(category: category),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
