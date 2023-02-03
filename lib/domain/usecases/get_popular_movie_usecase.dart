import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetPopularMovieUseCase extends BaseUsecase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async =>
      await baseMoviesRepository.getPopularMovies();
}
