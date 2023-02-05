// base url for api
// const baseUrl = "https://api.themoviedb.org/3";
// const apiKey = "496b90b66ead4ed1e4b4fc71a17c6fa9";
const apiRequest =
    "https://api.themoviedb.org/3/movie/550?api_key=496b90b66ead4ed1e4b4fc71a17c6fa9";

class ApiServices {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "496b90b66ead4ed1e4b4fc71a17c6fa9";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String imageUrl(String path) => "$baseImageUrl$path";
  static const String accesstokenApi =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OTZiOTBiNjZlYWQ0ZWQxZTRiNGZjNzFhMTdjNmZhOSIsInN1YiI6IjYzYjU5YjU0YTkxMTdmMDViMGRiMzMyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.50Kq9QpKl4v6fbbad-wY-kLbyZc6esRpCGuiR3ux_zo";
  static const String nowPlayingMoviePath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviePath =
      "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviePath =
      "$baseUrl/movie/top_rated?api_key=$apiKey";
  static String movieDetailsPath(int movieID) =>
      "$baseUrl/movie/$movieID?api_key=$apiKey";
  static String recommendationsPath(int movieID) =>
      "$baseUrl/movie/$movieID/recommendations?api_key=$apiKey";
}
