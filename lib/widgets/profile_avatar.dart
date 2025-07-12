import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String avatarUrl;
  const ProfileAvatar({super.key, required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(56)),
      child: CircleAvatar(
        radius: 48,
        backgroundColor: Colors.grey,
        backgroundImage: NetworkImage(avatarUrl),
      ),
    );
  }
}
