part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  // for movie details
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  // properity for movie recommendations
  final List<Recommendations> recommendationsList;
  final RequestState recomendationsState;
  final String recommendationsMessage;
  const MovieDetailsState({
    this.recommendationsList = const [],
    this.recomendationsState = RequestState.loading,
    this.recommendationsMessage = '',
    this.movieDetails,
    this.movieDetailsState = RequestState.loading,
    this.movieDetailsMessage = '',
  });

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendations>? recommendationsList,
    RequestState? recomendationsState,
    String? recommendationsMessage,
  }) =>
      MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendationsList: recommendationsList ?? this.recommendationsList,
        recomendationsState: recomendationsState ?? this.recomendationsState,
        recommendationsMessage:
            recommendationsMessage ?? this.recommendationsMessage,
      );

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendationsList,
        recomendationsState,
        recommendationsMessage,
      ];
}
