import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  late final int id;
  late final String title;
  late final String backdropPath; // properity of image
  late final List<int> genreIds;
  late final String overView; // descriptions
  late final String voteAverage; // averages of vot
  late final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genreIds,
    required this.overView,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object> get props => [
        id,
        title,
        backdropPath,
        genreIds,
        overView,
        voteAverage,
        releaseDate,
      ];

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    backdropPath = json['backdropPath'];
    genreIds = json['genreIds'];
    overView = json['overview'];
    voteAverage = json['voteAverage'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['backdropPath'] = backdropPath;
    data['genreIds'] = genreIds;
    data['overview'] = overView;
    data['voteAverage'] = voteAverage;
    data['releaseDate'] = releaseDate;
    return data;
  }
}

/*class Movie {
  late final int id;
  late final String title;
  late final String backdropPath; // properity of image
  late final String originalTitle;
  late final double popularity;
  late final String originalLanguage;
  late final String overview;
  late final String posterPath;
  late final String releaseDate;
  late final bool video;
  late final int voteCount;
  late final String voteAverage;

  late String error;

  Movie(
    this.backdropPath,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteCount,
    this.voteAverage,
  );

  Movie.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdropPath'];
    id = json['id'];
    originalLanguage = json['originalLanguage'];
    originalTitle = json['originalTitle'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['posterPath'];
    releaseDate = json['releaseDate'];
    title = json['title'];
    video = json['video'];
    voteCount = json['voteCount'];
    voteAverage = json['voteAverage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdropPath'] = backdropPath;
    data['id'] = id;
    data['originalLanguage'] = originalLanguage;
    data['originalTitle'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['posterPath'] = posterPath;
    data['releaseDate'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['voteCount'] = voteCount;
    data['voteAverage'] = voteAverage;
    return data;
  }
}*/
