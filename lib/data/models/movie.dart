class Movie {
  late final String backdropPath;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
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
}
