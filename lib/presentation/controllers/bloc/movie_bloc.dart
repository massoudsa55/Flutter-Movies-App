import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/usecases/get_now_playing_movie_usecase.dart';
import 'movie_state.dart';

part 'movie_event.dart';
// part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  MovieBloc(this.getNowPlayingMovieUseCase) : super(const MovieState()) {
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
  }
}
