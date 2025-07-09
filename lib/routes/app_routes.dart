import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/pages/home_page.dart';
import 'package:project_a/pages/lists_page.dart';
import 'package:project_a/pages/profile_page.dart';
import 'package:project_a/pages/search_page.dart';

class AppRoute {
  final String path;
  final String label;
  final WidgetBuilder builder;
  final IconData icon;
  final bool? hideButton;

  AppRoute({
    required this.path,
    required this.label,
    required this.builder,
    required this.icon,
    this.hideButton = false,
  });
}

final List<AppRoute> appRoutes = [
  AppRoute(
    path: '/',
    builder: (context) => HomePage(),
    label: 'Home',
    icon: LucideIcons.house,
  ),
  AppRoute(
    path: '/search',
    builder: (context) => SearchPage(),
    label: 'Search',
    icon: LucideIcons.search,
  ),
  AppRoute(
    path: '/list',
    builder: (context) => ListsPage(),
    label: 'Lists',
    icon: LucideIcons.bookmark,
  ),
  AppRoute(
    path: '/profile',
    builder: (context) => ProfilePage(),
    label: 'Profile',
    icon: LucideIcons.userRound,
  ),
];
