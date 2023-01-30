import 'package:flutter_movies_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_movies_app/data/models/movie_model.dart';
import 'package:flutter_movies_app/domain/entities/movie.dart';
import 'package:flutter_movies_app/domain/repository/base_movies_repository.dart';

import '../apis/movie_api.dart';

/*class MovieRepository {
  final MovieApis movieApis;

  MovieRepository(this.movieApis);
  // get all movies now_playing from api
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final movies = await movieApis.getNowPlayingMovies();
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
}*/

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieApis baseMovieApis;
  MovieRepository(this.baseMovieApis);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final movies = await baseMovieApis.getNowPlayingMovies();
    try {
      return Right(movies.map((movie) => MovieModel.fromJson(movie)).toList());
    } on InternetFailure catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final movies = await baseMovieApis.getPopularMovies();
    try {
      return Right(movies.map((movie) => MovieModel.fromJson(movie)).toList());
    } on InternetFailure catch (e) {
      return Left(InternetFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final movies = await baseMovieApis.getTopRateMovies();
    try {
      return Right(movies.map((movie) => MovieModel.fromJson(movie)).toList());
    } on InternetFailure catch (e) {
      return Left(InternetFailure(e.message));
    }
  }
}
