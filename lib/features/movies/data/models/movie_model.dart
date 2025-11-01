class MovieModel {
  final int id;
  final String title;
  final String? posterPath;
  final String? overview;
  final String? releaseDate;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.title,
    this.posterPath,
    this.overview,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      posterPath: json['poster_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
    );
  }

  String get fullPosterPath {
    if (posterPath == null) return '';
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String get releaseYear {
    if (releaseDate == null || releaseDate!.isEmpty) return 'N/A';
    return releaseDate!.split('-').first;
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'poster_path': posterPath,
    'overview': overview,
    'release_date': releaseDate,
    'vote_average': voteAverage,
    'vote_count': voteCount,
  };
}
