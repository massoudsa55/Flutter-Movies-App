import 'package:flutter/material.dart';

import '../../../data/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final MovieModel movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      color: Colors.yellowAccent,
      child: Text(movie.title),
    );
  }
}
