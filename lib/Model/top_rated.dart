class TopRated {
  TopRated({
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });
  late final String backdropPath;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final double voteAverage;
  late final int voteCount;

  TopRated.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}
