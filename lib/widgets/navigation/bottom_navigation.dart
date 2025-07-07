import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_a/models/navigation_item_data.dart';
import 'package:project_a/widgets/navigation/navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  static final List<NavigationItemModel> navigationItems = [
    NavigationItemModel(
      icon: FontAwesomeIcons.house,
      label: 'Home',
      onPressed: () {},
      active: true,
    ),
    NavigationItemModel(
      icon: FontAwesomeIcons.magnifyingGlass,
      label: 'Search',
      onPressed: () {},
      active: false,
    ),
    NavigationItemModel(
      icon: FontAwesomeIcons.solidBookmark,
      label: 'Lists',
      onPressed: () {},
      active: false,
    ),
    NavigationItemModel(
      icon: FontAwesomeIcons.solidUser,
      label: 'Profile',
      onPressed: () {},
      active: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      padding: EdgeInsets.only(top: 8, bottom: 4),
      decoration: BoxDecoration(
        color: Color.fromRGBO(21, 21, 29, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: BoxBorder.fromLTRB(
          top: BorderSide(color: Color.fromRGBO(48, 48, 67, 0.5), width: 2),
          left: BorderSide(color: Color.fromRGBO(48, 48, 67, 0.5), width: 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (final item in navigationItems)
            Expanded(child: NavigationItem(item: item)),
        ],
      ),
    );
  }
}
