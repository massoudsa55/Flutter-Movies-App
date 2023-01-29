import 'package:dio/dio.dart';

import '../../core/constants/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../../core/services/api_services.dart';

abstract class BaseMovieApis {
  // get popular movies from api
  Future<List<dynamic>> getNowPlayingMovies();
  // get popular movies from api
  Future<List<dynamic>> getPopularMovies();
  // get top rate movies from api
  Future<List<dynamic>> getTopRateMovies();
}

class MovieApis extends BaseMovieApis {
  @override
  Future<List<dynamic>> getNowPlayingMovies() async {
    Response response = await Dio().get(
      ApiServices.nowPlayingMoviePath,
    );
    if (response.statusCode == 200) {
      return response.data['results'] as List;
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<dynamic>> getPopularMovies() async {
    Response response = await Dio().get(ApiServices.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return response.data['results'] as List;
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

  @override
  Future<List<dynamic>> getTopRateMovies() async {
    Response response = await Dio().get(ApiServices.topRatedMoviePath);
    if (response.statusCode == 200) {
      return response.data['results'] as List;
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }
}
