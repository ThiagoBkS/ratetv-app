import 'package:flutter/material.dart';
import 'package:project_a/widgets/horizontal_card_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromRGBO(21, 21, 29, 1)),

      backgroundColor: Color.fromRGBO(21, 21, 29, 1),
      body: Padding(padding: EdgeInsets.all(16), child: HomeBody()),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // SizedBox(height: 24),
        // HorizontalCardList(),
        // SizedBox(height: 24),
        // HorizontalCardList(),
        // SizedBox(height: 24),
        // HorizontalCardList(),
      ],
    );
  }
}
