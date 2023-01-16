import 'package:flutter_movies_app/data/models/movie_model.dart';

import '../apis/movie_api.dart';

class MovieRepository {
  final MovieApis movieApis;

  MovieRepository(this.movieApis);
  // get all movies now_playing from api
  Future<List<MovieModel>> getAllMovies() async {
    final movies = await movieApis.getNowPlaying();
    return movies.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  // get popular movies
  Future<List<MovieModel>> getPopularMovies() async {
    final movies = await movieApis.getPopularMovies();
    return movies.map((movie) => MovieModel.fromJson(movie)).toList();
  }

  // get top rate movies
  Future<List<MovieModel>> getTopRateMovies() async {
    final movies = await movieApis.getTopRateMovies();
    return movies.map((movie) => MovieModel.fromJson(movie)).toList();
  }
}
