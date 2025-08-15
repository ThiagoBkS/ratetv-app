import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:project_a/pages/home_page.dart';
import 'package:project_a/pages/movie_page.dart';
import 'package:project_a/pages/profile_page.dart';
import 'package:project_a/pages/search_page.dart';
import 'package:project_a/pages/statistics_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  int? selectedMovieId;

  void openMovie(int movieId) {
    setState(() {
      selectedMovieId = movieId;
    });
  }

  void goToTab(int index) {
    setState(() {
      currentPageIndex = index;
      selectedMovieId = null;
    });
  }

  final pages = [
    SearchPage(),
    StatisticsPage(),
    ProfilePage(
      publicId:
          "d6fc1650553d0b6cb60b5ccd4eb8aeb62f12320e39a767e1d6087e523d5ee2fa",
    ),
  ];

  Widget get currentPage {
    if (selectedMovieId != null) {
      return MoviePage(
        movieId: selectedMovieId!,
        onBackToMain: () => setState(() => selectedMovieId = null),
      );
    }

    if (currentPageIndex == 0) {
      return HomePage(
        onMovieSelected: (movieId) {
          setState(() {
            selectedMovieId = movieId;
          });
        },
      );
    }

    switch (currentPageIndex) {
      case 0:
        return HomePage(
          onMovieSelected: (movieId) {
            setState(() {
              selectedMovieId = movieId;
            });
          },
        );
      case 1:
        return const SearchPage();

      case 2:
        return const ProfilePage(
          publicId:
              "d6fc1650553d0b6cb60b5ccd4eb8aeb62f12320e39a767e1d6087e523d5ee2fa",
        );

      default:
        return const Center(child: Text("Not Found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: Material(
        color: Colors.transparent,
        child: BottomNavigationBar(
          currentIndex: currentPageIndex,
          onTap: goToTab,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: Colors.transparent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
