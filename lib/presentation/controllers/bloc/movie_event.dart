part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieEvant extends MovieEvent {}

class GetPopularMovieEvant extends MovieEvent {}

class GetTopRatedMovieEvant extends MovieEvent {}
