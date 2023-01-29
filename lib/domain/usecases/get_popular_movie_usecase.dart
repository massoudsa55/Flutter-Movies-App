import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMovieUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMovieUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> run() async =>
      await baseMoviesRepository.getPopularMovies();
}
