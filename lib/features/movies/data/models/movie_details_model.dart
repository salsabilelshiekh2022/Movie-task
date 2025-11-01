class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}

class MovieDetailsModel {
  final int id;
  final String title;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final String? releaseDate;
  final double voteAverage;
  final int voteCount;
  final List<Genre> genres;
  final int? runtime;
  final String? tagline;
  final String status;

  MovieDetailsModel({
    required this.id,
    required this.title,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.genres,
    this.runtime,
    this.tagline,
    required this.status,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    final genresList = json['genres'] as List?;
    final genres = genresList != null
        ? genresList.map((e) => Genre.fromJson(e)).toList()
        : <Genre>[];

    return MovieDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      genres: genres,
      runtime: json['runtime'],
      tagline: json['tagline'],
      status: json['status'] ?? 'Unknown',
    );
  }

  String get fullPosterPath {
    if (posterPath == null) return '';
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String get fullBackdropPath {
    if (backdropPath == null) return '';
    return 'https://image.tmdb.org/t/p/original$backdropPath';
  }

  String get releaseYear {
    if (releaseDate == null || releaseDate!.isEmpty) return 'N/A';
    return releaseDate!.split('-').first;
  }

  String get formattedReleaseDate {
    if (releaseDate == null || releaseDate!.isEmpty) return 'N/A';
    final parts = releaseDate!.split('-');
    if (parts.length != 3) return releaseDate!;

    final year = parts[0];
    final month = parts[1];
    final day = parts[2];

    return '$day/$month/$year';
  }

  String get runtimeFormatted {
    if (runtime == null) return 'N/A';
    final hours = runtime! ~/ 60;
    final minutes = runtime! % 60;
    return '${hours}h ${minutes}m';
  }

  String get genresString {
    if (genres.isEmpty) return 'N/A';
    return genres.map((g) => g.name).join(', ');
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'poster_path': posterPath,
    'backdrop_path': backdropPath,
    'overview': overview,
    'release_date': releaseDate,
    'vote_average': voteAverage,
    'vote_count': voteCount,
    'genres': genres.map((g) => g.toJson()).toList(),
    'runtime': runtime,
    'tagline': tagline,
    'status': status,
  };
}
