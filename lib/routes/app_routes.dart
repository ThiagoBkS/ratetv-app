import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/pages/collections_page.dart';
import 'package:project_a/pages/home_page.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/pages/profile_page.dart';
import 'package:project_a/pages/search_page.dart';

class AppRoute {
  final String path;
  final String label;
  final IconData icon;
  final WidgetBuilder builder;
  final bool? hidden;

  AppRoute({
    required this.path,
    required this.label,
    required this.icon,
    required this.builder,
    this.hidden,
  });
}

final List<AppRoute> appRoutes = [
  AppRoute(
    path: '/',
    label: 'Home',
    icon: LucideIcons.house,
    builder: (context) => HomePage(),
  ),
  AppRoute(
    path: '/search',
    label: 'Search',
    icon: LucideIcons.search,
    builder: (context) => SearchPage(),
  ),
  AppRoute(
    path: '/collections',
    label: 'My Lists',
    icon: LucideIcons.bookmark,
    builder: (context) => CollectionsPage(),
  ),
  AppRoute(
    path: '/profile',
    label: 'Profile',
    icon: LucideIcons.userRound,
    builder: (context) => ProfilePage(),
  ),
  AppRoute(
    path: '/movie',
    label: 'Movie',
    icon: LucideIcons.appWindow,
    builder: (context) => MoviePage(),
    hidden: false,
  ),
];
