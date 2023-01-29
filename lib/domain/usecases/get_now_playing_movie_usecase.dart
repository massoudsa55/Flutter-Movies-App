import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetNowPlayingMovieUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMovieUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> run() async =>
      await baseMoviesRepository.getNowPlayingMovies();
}
