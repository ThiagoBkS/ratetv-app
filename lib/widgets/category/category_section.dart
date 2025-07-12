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
    return SizedBox(
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
                CategoryItem(
                  category: CategoryModel(
                    name: "Action",
                    icon: FontAwesomeIcons.bolt,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Adventure",
                    icon: FontAwesomeIcons.map,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Comedy",
                    icon: FontAwesomeIcons.laugh,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Drama",
                    icon: FontAwesomeIcons.theaterMasks,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Romance",
                    icon: FontAwesomeIcons.heart,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Horror",
                    icon: FontAwesomeIcons.ghost,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Thriller",
                    icon: FontAwesomeIcons.exclamationTriangle,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Science Fiction",
                    icon: FontAwesomeIcons.robot,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Fantasy",
                    icon: FontAwesomeIcons.magic,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Animation",
                    icon: FontAwesomeIcons.film,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Musical",
                    icon: FontAwesomeIcons.music,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Documentary",
                    icon: FontAwesomeIcons.bookOpen,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Biography",
                    icon: FontAwesomeIcons.user,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "War",
                    icon: FontAwesomeIcons.shieldAlt,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Crime",
                    icon: FontAwesomeIcons.userSecret,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Western",
                    icon: FontAwesomeIcons.hatCowboy,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Sports",
                    icon: FontAwesomeIcons.footballBall,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Mystery",
                    icon: FontAwesomeIcons.question,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Kids",
                    icon: FontAwesomeIcons.child,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Erotic",
                    icon: FontAwesomeIcons.fire,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Religious",
                    icon: FontAwesomeIcons.pray,
                  ),
                ),
                CategoryItem(
                  category: CategoryModel(
                    name: "Disaster",
                    icon: FontAwesomeIcons.bolt,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
