import '../../domain/entities/movie_details.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel(
      {required super.id,
      required super.backdropPath,
      required super.genres,
      required super.title,
      required super.overView,
      required super.runTime,
      required super.releaseDate,
      required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from((json['genres'] as List)
            .map((genre) => GenresModel.fromJson(genre))),
        title: json['title'],
        overView: json['overview'],
        runTime: json['run_time'] ?? 1,
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
      );
}
