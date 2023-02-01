import 'package:flutter_movies_app/data/apis/movie_api.dart';
import 'package:flutter_movies_app/data/repository/movie_repository.dart';
import 'package:flutter_movies_app/domain/repository/base_movies_repository.dart';
import 'package:flutter_movies_app/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:flutter_movies_app/presentation/controllers/bloc/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    // Movie Bloc
    getIt.registerFactory(() => MovieBloc(getIt()));
    // Movie Apis
    getIt.registerLazySingleton<BaseMovieApis>(() => MovieApis());
    // Movie Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MovieRepository(getIt()));
    // Movie UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUseCase(getIt()));
  }
}
