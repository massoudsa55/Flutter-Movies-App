import 'package:get_it/get_it.dart';

import '../../data/apis/movie_api.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_now_playing_movie_usecase.dart';
import '../../domain/usecases/get_popular_movie_usecase.dart';
import '../../domain/usecases/get_top_rated_movie_usecase.dart';
import '../../presentation/controllers/bloc/movie_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    // Movie Bloc
    getIt.registerFactory(() => MovieBloc(getIt(), getIt(), getIt()));

    // Movie Apis
    getIt.registerLazySingleton<BaseMovieApis>(() => MovieApis());

    // Movie Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MovieRepository(getIt()));

    // Movie UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMovieUseCase(getIt()));
  }
}
