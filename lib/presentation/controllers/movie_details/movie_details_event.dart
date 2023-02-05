part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieID;

  const GetMovieDetailsEvent(this.movieID);

  @override
  List<Object?> get props => [movieID];
}

class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieID;

  const GetRecommendationsEvent(this.movieID);

  @override
  List<Object?> get props => [movieID];
}
