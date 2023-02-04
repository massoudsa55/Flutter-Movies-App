import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/movie.dart';
import '../entities/movie_details.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  // get all movies now_playing from api
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  // get popular movies
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  // get top rate movies
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  // get movie details
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
}
