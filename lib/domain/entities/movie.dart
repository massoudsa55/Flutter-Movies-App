import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath; // properity of image
  final List<int> genreIds;
  final String overView; // descriptions
  final String voteAverage; // averages of vot
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overView,
        voteAverage,
        releaseDate,
      ];
}
