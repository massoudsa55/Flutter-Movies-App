import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      color: const Color.fromARGB(255, 201, 201, 158),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(movie.title),
          const SizedBox(height: 20),
          Text(movie.overView),
        ],
      ),
    );
  }
}
