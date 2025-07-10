import 'package:flutter/material.dart';
import 'package:project_a/widgets/bottom_navigation.dart';
import 'package:project_a/widgets/profile_widgets/profile_content.dart';
import 'package:project_a/widgets/profile_widgets/profile_list_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProfilePageBody()),
      bottomNavigationBar: BottomNavigation(pageIndex: 3),
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          ProfileContent(),
          SizedBox(height: 8),
          ProfileListCard(),
          SizedBox(height: 8),
          ProfileListCard(),
          SizedBox(height: 8),
          ProfileListCard(),
        ],
      ),
    );
  }
}
