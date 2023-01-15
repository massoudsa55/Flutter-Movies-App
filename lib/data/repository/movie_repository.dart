import 'package:flutter_movies_app/data/models/movie.dart';

import '../apis/movie_api.dart';

class MovieRepository {
  final MovieApis movieApis;

  MovieRepository(this.movieApis);
  // get all movies from api
  Future<List<Movie>> getAllMovies() async {
    final movies = await movieApis.getAllMovies();
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }

  // get Now Playing
  Future<List<Movie>> getNowPlaying() async {}

  // get popular movies
  Future<List<Movie>> getPopularMovies() async {}
}
