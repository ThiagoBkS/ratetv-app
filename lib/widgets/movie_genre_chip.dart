import 'package:flutter/material.dart';

class MovieGenreChip extends StatelessWidget {
  final String label;
  const MovieGenreChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        decoration: BoxDecoration(
          color: Color.fromRGBO(24, 28, 31, 0.5),
          border: BoxBorder.all(color: Color.fromRGBO(60, 60, 60, 1), width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(label, style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
