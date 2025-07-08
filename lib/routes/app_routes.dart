import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_a/pages/home_page.dart';
import 'package:project_a/pages/lists_page.dart';
import 'package:project_a/pages/profile_page.dart';
import 'package:project_a/pages/search_page.dart';

class AppRoute {
  final String path;
  final String label;
  final WidgetBuilder builder;
  final IconData icon;

  AppRoute({
    required this.path,
    required this.label,
    required this.builder,
    required this.icon,
  });
}

final List<AppRoute> appRoutes = [
  AppRoute(
    path: '/',
    builder: (context) => HomePage(),
    label: 'Home',
    icon: FontAwesomeIcons.house,
  ),
  AppRoute(
    path: '/search',
    builder: (context) => SearchPage(),
    label: 'Search',
    icon: FontAwesomeIcons.magnifyingGlass,
  ),
  AppRoute(
    path: '/list',
    builder: (context) => ListsPage(),
    label: 'Lists',
    icon: FontAwesomeIcons.solidBookmark,
  ),
  AppRoute(
    path: '/profiel',
    builder: (context) => ProfilePage(),
    label: 'Profile',
    icon: FontAwesomeIcons.solidUser,
  ),
];
