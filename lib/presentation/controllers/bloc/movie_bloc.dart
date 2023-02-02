import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/usecases/get_now_playing_movie_usecase.dart';
import '../../../domain/usecases/get_popular_movie_usecase.dart';
import '../../../domain/usecases/get_top_rated_movie_usecase.dart';
import 'movie_state.dart';

part 'movie_event.dart';
// part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  MovieBloc(
    this.getNowPlayingMovieUseCase,
    this.getPopularMovieUseCase,
    this.getTopRatedMovieUseCase,
  ) : super(const MovieState()) {
    on<GetNowPlayingMovieEvant>((event, emit) async {
      final result = await getNowPlayingMovieUseCase.run();
      result.fold(
          (l) => emit(MovieState(
                nowPlayingRequestState: RequestState.error,
                nowPlayingMessage: l.message,
              )),
          (r) => emit(MovieState(
                nowPlayingListMovies: r,
                nowPlayingRequestState: RequestState.laoded,
              )));
    });
    on<GetPopularMovieEvant>((event, emit) async {
      final result = await getPopularMovieUseCase.run();
      result.fold(
        (l) => emit(
          MovieState(
            popularRequestState: RequestState.error,
            popularMessage: l.message,
          ),
        ),
        (r) => MovieState(
          popularListMovies: r,
          popularRequestState: RequestState.laoded,
        ),
      );
    });
    on<GetTopRatedMovieEvant>((event, emit) async {
      final result = await getTopRatedMovieUseCase.run();
      result.fold(
        (l) => emit(
          MovieState(
            topRatedRequestState: RequestState.error,
            topRatedMessage: l.message,
          ),
        ),
        (r) => MovieState(
          topRatedListMovies: r,
          topRatedRequestState: RequestState.laoded,
        ),
      );
    });
  }
}
