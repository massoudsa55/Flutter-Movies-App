import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../../core/services/api_services.dart';
import '../../core/usecase/base_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_movie_recommendations.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';
import '../models/recommendations_model.dart';

abstract class BaseMovieApis {
  // get popular movies from api
  Future<List<MovieModel>> getNowPlayingMovies();
  // get popular movies from api
  Future<List<MovieModel>> getPopularMovies();
  // get top rate movies from api
  Future<List<MovieModel>> getTopRateMovies();
  // get movie details from api
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
  // get movie recommendations from api
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters);
}

class MovieApis extends BaseMovieApis {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(ApiServices.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))).toList();
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    Response response = await Dio().get(ApiServices.popularMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))).toList();
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getTopRateMovies() async {
    Response response = await Dio().get(ApiServices.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))).toList();
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
      MovieDetailsParameters parameters) async {
    Response response =
        await Dio().get(ApiServices.movieDetailsPath(parameters.movieID));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(
      RecommendationsParameters parameters) async {
    Response response =
        await Dio().get(ApiServices.recommendationsPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationsModel>.from((response.data['results'] as List)
          .map((e) => RecommendationsModel.fromJson(e))).toList();
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }
}
