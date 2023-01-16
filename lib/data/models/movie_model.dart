import 'package:equatable/equatable.dart';
import 'package:flutter_movies_app/data/entitys/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overView,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        overView: json['overView'],
        voteAverage: json['vote_average'],
        releaseDate: json['release_date'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['overview'] = overView;
    data['vote_average'] = voteAverage;
    data['release_date'] = releaseDate;
    return data;
  }
}
