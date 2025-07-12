import 'package:flutter/material.dart';
import 'package:project_a/widgets/custom_search_bar.dart';
import 'package:project_a/widgets/movie_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        spacing: 24,
        children: [
          CustomSearchBar(
            hintText: "Rate and review movies.",
            controller: _controller,
            onChanged: (value) {
              setState(() {});
            },
            onClear: () {
              _controller.clear();
              setState(() {});
            },
          ),
          Expanded(
            child: ListView(
              children: [
                GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1 / 1.5,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(
                    12,
                    (index) => MovieCard(
                      image: "https://placehold.co/100x150/EEE/31343C.jpg",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
