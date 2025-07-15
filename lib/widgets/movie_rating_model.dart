import 'package:flutter/material.dart';

class MovieRatingModel extends StatefulWidget {
  const MovieRatingModel({super.key});

  @override
  State<StatefulWidget> createState() {
    return MovieRatingModelState();
  }
}

class MovieRatingModelState extends State<MovieRatingModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Color.fromRGBO(56, 63, 68, 0),
      child: Text("opa"),
    );
  }
}
