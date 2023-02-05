import 'package:flutter_movies_app/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_movies_app/presentation/controllers/movie_details/movie_details_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/apis/movie_api.dart';
import '../../data/repository/movie_repository.dart';
import '../../domain/repository/base_movies_repository.dart';
import '../../domain/usecases/get_movie_recommendations.dart';
import '../../domain/usecases/get_now_playing_movie_usecase.dart';
import '../../domain/usecases/get_popular_movie_usecase.dart';
import '../../domain/usecases/get_top_rated_movie_usecase.dart';
import '../../presentation/controllers/movie/movie_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    // Bloc
    getIt.registerFactory(() => MovieBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt(), getIt()));

    // Apis
    getIt.registerLazySingleton<BaseMovieApis>(() => MovieApis());

    // Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(
        () => MovieRepository(getIt()));

    // UseCases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => GetPopularMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => GetTopRatedMovieUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetRecommendationsUseCase(getIt()));
  }
}
