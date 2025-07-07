import 'package:flutter/material.dart';

class NavigationItemModel {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool active;

  NavigationItemModel({
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.active,
  });
}
