import 'package:dartz/dartz.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../apis/movie_api.dart';

class MovieRepository extends BaseMoviesRepository {
  final BaseMovieApis baseMovieApis;
  MovieRepository(this.baseMovieApis);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final movies = await baseMovieApis.getNowPlayingMovies();
    try {
      return Right(movies);
    } on InternetException catch (failure) {
      return Left(InternetFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final movies = await baseMovieApis.getPopularMovies();
    try {
      return Right(movies);
    } on InternetException catch (failure) {
      return Left(InternetFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final movies = await baseMovieApis.getTopRateMovies();
    try {
      return Right(movies);
    } on InternetException catch (failure) {
      return Left(InternetFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
