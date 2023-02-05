import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/base_usecase.dart';
import '../entities/movie_details.dart';
import '../repository/base_movies_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUsecase<MovieDetails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
          MovieDetailsParameters parameters) async =>
      await baseMoviesRepository.getMovieDetails(parameters);
}

class MovieDetailsParameters extends Equatable {
  final int movieID;

  const MovieDetailsParameters({required this.movieID});
  @override
  List<Object?> get props => [movieID];
}
