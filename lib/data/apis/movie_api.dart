import 'package:dio/dio.dart';
import 'package:flutter_movies_app/core/constants/error/exceptions.dart';

import '../../core/constants/constants.dart';
import '../../core/network/error_message_model.dart';

class MovieApis {
  late Dio dio;

  MovieApis() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      // contentType: 'UTF-8',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000, // 20 seconds
      receiveTimeout: 20 * 1000, // 20 seconds
    );
    dio = Dio(baseOptions);
  }
  // get all movies now_playing from api
  Future<List<dynamic>> getNowPlaying() async {
    Response response = await dio.get('/movie/now_playing?api_key=$apiKey');
    switch (response.statusCode) {
      case 200:
        return response.data['results'] as List;
      case 401:
        return [];
      case 405:
        return [];
      default:
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  // get popular movies from api
  Future<List<dynamic>> getPopularMovies() async {
    Response response = await dio.get('/movie/now_playing?api_key=$apiKey');
    switch (response.statusCode) {
      case 200:
        return response.data['results'] as List;
      case 401:
        return [];
      case 405:
        return [];
      default:
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  // get top rate movies from api
  Future<List<dynamic>> getTopRateMovies() async {
    Response response = await dio.get('/movie/now_playing?api_key=$apiKey');
    switch (response.statusCode) {
      case 200:
        return response.data['results'] as List;
      case 401:
        return [];
      case 405:
        return [];
      default:
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
