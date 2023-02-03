import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../repository/base_movies_repository.dart';

class GetTopRatedMovieUseCase extends BaseUsecase<List<Movie>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMovieUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call() async =>
      await baseMoviesRepository.getTopRatedMovies();
}
