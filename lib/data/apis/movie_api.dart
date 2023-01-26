import 'package:dio/dio.dart';
import 'package:flutter_movies_app/data/models/movie_model.dart';

import '../../core/constants/error/exceptions.dart';
import '../../core/network/error_message_model.dart';
import '../../core/services/api_services.dart';

class MovieApis {
  late Dio dio;

  MovieApis() {
    // BaseOptions baseOptions = BaseOptions(
    //   // baseUrl: baseUrl,
    //   // contentType: 'UTF-8',
    //   receiveDataWhenStatusError: true,
    //   connectTimeout: 20 * 1000, // 20 seconds
    //   receiveTimeout: 20 * 1000, // 20 seconds
    // );
    // dio = Dio(baseOptions);
    dio = Dio();
  }
  // get all movies now_playing from api
  Future<List<dynamic>> getNowPlayingMovies() async {
    Response response = await dio.get(ApiServices.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return response.data['results'];
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

// get popular movies from api
  Future<List<dynamic>> getPopularMovies() async {
    Response response = await dio.get(ApiServices.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return response.data['results'] as List;
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }

// get top rate movies from api
  Future<List<dynamic>> getTopRateMovies() async {
    Response response = await dio.get(ApiServices.topRatedMoviePath);
    if (response.statusCode == 200) {
      return response.data['results'] as List;
    }
    return throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data));
  }
}
