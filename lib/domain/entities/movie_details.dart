import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath; // path of picture
  final List<Genres> genres; //
  final String title; // title of movie
  final String overView; // descriptions of movie
  final int runTime; // total time of movie
  final String releaseDate; // date of movie
  final double voteAverage;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.title,
    required this.overView,
    required this.runTime,
    required this.releaseDate,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        genres,
        title,
        overView,
        runTime,
        releaseDate,
        voteAverage,
      ];
}
