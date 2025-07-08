import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.pen, color: Colors.grey, size: 18),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.gear, color: Colors.grey, size: 18),
        ),
      ],
    );
  }
}
