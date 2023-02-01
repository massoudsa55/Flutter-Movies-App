/*part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}*/

import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingListMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  const MovieState({
    this.nowPlayingListMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  @override
  List<Object?> get props => [
        nowPlayingListMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
      ];
}
