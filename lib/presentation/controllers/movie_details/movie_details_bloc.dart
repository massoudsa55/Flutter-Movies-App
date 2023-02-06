import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/entities/movie_details.dart';
import '../../../domain/entities/recommendation.dart';
import '../../../domain/usecases/get_movie_details_usecase.dart';
import '../../../domain/usecases/get_movie_recommendations.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationsUseCase getRecommendationsUseCase;
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieID: event.movieID));
    result.fold(
      (l) => emit(state.copyWith(
        movieDetailsState: RequestState.error,
        movieDetailsMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        movieDetails: r,
        movieDetailsState: RequestState.laoded,
      )),
    );
  }

  FutureOr<void> _getRecommendations(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationsUseCase(
        RecommendationsParameters(id: event.movieID));
    result.fold(
      (l) => emit(
        state.copyWith(
          recomendationsState: RequestState.error,
          recommendationsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendationsList: r,
          recomendationsState: RequestState.laoded,
        ),
      ),
    );
  }
}
