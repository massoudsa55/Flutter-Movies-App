import 'package:flutter_movies_app/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../core/usecase/base_usecase.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUseCase extends BaseUsecase<List<MovieDetails>> {
  @override
  Future<Either<Failure, List<MovieDetails>>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
