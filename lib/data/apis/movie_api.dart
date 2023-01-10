import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';

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
  // get all movies from api
  Future<List<dynamic>> getAllMovies() async {
    try {
      Response response = await dio.get('/movie/now_playing?api_key=$apiKey');
      return response.data['results'] as List;
      // ignore: avoid_print, dead_code
      print("response.data['results'] = ${response.data['results']}");
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return [];
    }
  }
}
