import 'package:flutter/material.dart';
import 'package:project_a/widgets/bottom_navigation.dart';

class MyLists extends StatelessWidget {
  const MyLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text("My Lists")),
      bottomNavigationBar: BottomNavigation(pageIndex: 2),
    );
  }
}
