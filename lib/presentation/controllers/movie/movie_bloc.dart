import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/usecase/base_usecase.dart';
import '../../../core/utils/enums.dart';
import '../../../domain/usecases/get_now_playing_movie_usecase.dart';
import '../../../domain/usecases/get_popular_movie_usecase.dart';
import '../../../domain/usecases/get_top_rated_movie_usecase.dart';
import 'movie_state.dart';

part 'movie_event.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_getNowPlayingMovies);
    on<GetPopularMovieEvent>(_getPopularMovies);
    on<GetTopRatedMovieEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingRequestState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              nowPlayingListMovies: r,
              nowPlayingRequestState: RequestState.laoded,
            )));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getPopularMovieUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularRequestState: RequestState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularListMovies: r,
          popularRequestState: RequestState.laoded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedRequestState: RequestState.error,
          topRatedMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedListMovies: r,
          topRatedRequestState: RequestState.laoded,
        ),
      ),
    );
  }
}
