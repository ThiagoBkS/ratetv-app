import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:project_a/pages/home_page.dart';
import 'package:project_a/pages/my_lists.dart';
import 'package:project_a/pages/profile_page.dart';
import 'package:project_a/pages/search_page.dart';

class AppRoute {
  final String path;
  final String label;
  final WidgetBuilder builder;
  final IconData icon;
  final bool? hideButton;
  final int pageIndex;

  AppRoute({
    required this.path,
    required this.label,
    required this.builder,
    required this.icon,
    required this.pageIndex,
    this.hideButton = false,
  });
}

final List<AppRoute> appRoutes = [
  AppRoute(
    path: '/',
    builder: (context) => HomePage(),
    label: 'Home',
    icon: LucideIcons.house,
    pageIndex: 0,
  ),
  AppRoute(
    path: '/search',
    builder: (context) => SearchPage(),
    label: 'Search',
    icon: LucideIcons.search,
    pageIndex: 1,
  ),
  AppRoute(
    path: '/list',
    builder: (context) => MyLists(),
    label: 'Lists',
    icon: LucideIcons.bookmark,
    pageIndex: 2,
  ),
  AppRoute(
    path: '/profile',
    builder: (context) => ProfilePage(),
    label: 'Profile',
    icon: LucideIcons.userRound,
    pageIndex: 3,
  ),
];
