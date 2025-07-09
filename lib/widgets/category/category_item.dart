import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_a/widgets/category/category_section.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(48, 48, 67, 0.5),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
        ),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(category.icon, size: 20, color: Colors.white),
            Text(
              category.name,
              style: GoogleFonts.montserrat(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
