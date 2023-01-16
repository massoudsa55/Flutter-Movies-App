// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/models/movie_model.dart';
import '../../data/repository/movie_repository.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieRepository movieRepository;
  List<MovieModel> movies = [];
  MoviesCubit(this.movieRepository) : super(MoviesInitial());
  List<MovieModel> getAllMovies() {
    movieRepository.getAllMovies().then((movie) {
      emit(MoviesLoaded(movie));
      movies = movies;
    });
    return movies;
  }
}
