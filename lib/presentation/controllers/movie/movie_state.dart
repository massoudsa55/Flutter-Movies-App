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
  // properity of Now Playing Movie
  final List<Movie> nowPlayingListMovies;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;
  // properity of Popular Movie
  final List<Movie> popularListMovies;
  final RequestState popularRequestState;
  final String popularMessage;
  // properity of Top Rated Movie
  final List<Movie> topRatedListMovies;
  final RequestState topRatedRequestState;
  final String topRatedMessage;

  const MovieState({
    this.popularListMovies = const [],
    this.popularRequestState = RequestState.loading,
    this.popularMessage = '',
    this.topRatedListMovies = const [],
    this.topRatedRequestState = RequestState.loading,
    this.topRatedMessage = '',
    this.nowPlayingListMovies = const [],
    this.nowPlayingRequestState = RequestState.loading,
    this.nowPlayingMessage = '',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingListMovies,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    List<Movie>? popularListMovies,
    RequestState? popularRequestState,
    String? popularMessage,
    List<Movie>? topRatedListMovies,
    RequestState? topRatedRequestState,
    String? topRatedMessage,
  }) =>
      MovieState(
        nowPlayingListMovies: nowPlayingListMovies ?? this.nowPlayingListMovies,
        nowPlayingRequestState:
            nowPlayingRequestState ?? this.nowPlayingRequestState,
        nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
        popularListMovies: popularListMovies ?? this.popularListMovies,
        popularRequestState: popularRequestState ?? this.popularRequestState,
        popularMessage: popularMessage ?? this.popularMessage,
        topRatedListMovies: topRatedListMovies ?? this.topRatedListMovies,
        topRatedRequestState: topRatedRequestState ?? this.topRatedRequestState,
        topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      );

  @override
  List<Object?> get props => [
        nowPlayingListMovies,
        nowPlayingRequestState,
        nowPlayingMessage,
        popularListMovies,
        popularRequestState,
        popularMessage,
        topRatedListMovies,
        topRatedRequestState,
        topRatedMessage
      ];
}
