import 'package:flutter/material.dart';
import 'package:project_a/models/user_profile.dart';
import 'package:project_a/widgets/profile_widgets/profile_content.dart';
import 'package:project_a/widgets/profile_widgets/profile_list_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(child: ProfilePageBody()),
      // bottomNavigationBar: BottomNavigation(pageIndex: 3),
    );
  }
}

class ProfilePageBody extends StatelessWidget {
  ProfilePageBody({super.key});
  final UserProfile userProfile = UserProfile(
    name: "Thiago",
    username: "@thiago_bxk",
    avatarUrl: "https://avatars.githubusercontent.com/u/210406073?v=4",
    backdropUrl: "",
    likedCount: 918,
    watchedCount: 422,
    watchLaterCount: 12,
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileContent(userProfile: userProfile),
        Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            spacing: 8,
            children: [
              ProfileListCard(),
              ProfileListCard(),
              ProfileListCard(),
              ProfileListCard(),
              ProfileListCard(),
            ],
          ),
        ),
      ],
    );
  }
}

// ProfileContent(),
        // SizedBox(height: 8),
        // ProfileListCard(),
        // SizedBox(height: 8),
        // ProfileListCard(),
        // SizedBox(height: 8),
        // ProfileListCard(),