// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../../data/repository/movie_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieRepository movieRepository;
  List<Movie>? movies;
  MoviesCubit(this.movieRepository) : super(MoviesInitial());
  List<Movie> getAllMovies() {
    movieRepository.getAllMovies().then((movie) {
      emit(MoviesLoaded(movie));
      movies = movies;
    });
    return movies!;
  }
}
