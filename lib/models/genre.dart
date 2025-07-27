import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

final List<Genre> availableGenres = [
  Genre(id: 28, label: "Action", icon: LucideIcons.swords300),
  Genre(id: 12, label: "Adventure", icon: LucideIcons.map300),
  Genre(id: 16, label: "Animation", icon: LucideIcons.cat300),
  Genre(id: 35, label: "Comedy", icon: LucideIcons.smile300),
  Genre(id: 80, label: "Crime", icon: LucideIcons.gavel300),
  Genre(id: 99, label: "Documentary", icon: LucideIcons.book300),
  Genre(id: 18, label: "Drama", icon: LucideIcons.theater300),
  Genre(id: 10751, label: "Family", icon: LucideIcons.users300),
  Genre(id: 14, label: "Fantasy", icon: LucideIcons.wand300),
  Genre(id: 36, label: "History", icon: LucideIcons.clock300),
  Genre(id: 27, label: "Horror", icon: LucideIcons.ghost300),
  Genre(id: 10402, label: "Music", icon: LucideIcons.music300),
  Genre(id: 9648, label: "Mystery", icon: LucideIcons.eyeOff300),
  Genre(id: 10749, label: "Romance", icon: LucideIcons.heart300),
  Genre(id: 878, label: "Science Fiction", icon: LucideIcons.rocket300),
  Genre(id: 10770, label: "TV Movie", icon: LucideIcons.tv300),
  Genre(id: 53, label: "Thriller", icon: LucideIcons.bolt300),
  Genre(id: 10752, label: "War", icon: LucideIcons.shield300),
  Genre(id: 37, label: "Western", icon: LucideIcons.arrowDownToDot300),
];

class Genre {
  final int id;
  final String label;
  final IconData icon;

  const Genre({required this.id, required this.label, required this.icon});

  static Genre getGenreById(int id) {
    return availableGenres.firstWhere((genre) => genre.id == id);
  }
}
