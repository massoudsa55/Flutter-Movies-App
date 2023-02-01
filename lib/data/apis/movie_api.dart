import 'package:dio/dio.dart';

import '../../core/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../../core/services/api_services.dart';
import '../models/movie_model.dart';

abstract class BaseMovieApis {
  // get popular movies from api
  Future<List<MovieModel>> getNowPlayingMovies();
  // get popular movies from api
  Future<List<MovieModel>> getPopularMovies();
  // get top rate movies from api
  Future<List<MovieModel>> getTopRateMovies();
}

class MovieApis extends BaseMovieApis {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    Response response = await Dio().get(
      ApiServices.nowPlayingMoviePath,
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))).toList();
    }
    return throw InternetException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    Response response = await Dio().get(ApiServices.nowPlayingMoviePath);
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
}
