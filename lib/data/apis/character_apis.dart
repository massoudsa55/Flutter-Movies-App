import 'package:dio/dio.dart';

import '../../core/constants/constants.dart';

class CharacterApis {
  late Dio dio;

  CharacterApis() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: baseUrl,
      contentType: 'UTF-8',
      receiveDataWhenStatusError: true,
    );
  }
}
